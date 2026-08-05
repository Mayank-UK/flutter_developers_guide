import 'dart:async';
import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/domain/models/image_item.dart';
import 'package:flutter_developers_guide/domain/usecases/images/delete_image_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/images/upload_image_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/images/watch_images_use_case.dart';
import 'package:flutter_developers_guide/ui/blocs/images/images_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// --- Mocks ---
class MockWatchImagesUseCase extends Mock implements WatchImagesUseCase {}

class MockUploadImageUseCase extends Mock implements UploadImageUseCase {}

class MockDeleteImageUseCase extends Mock implements DeleteImageUseCase {}

void main() {
  late MockWatchImagesUseCase mockWatch;
  late MockUploadImageUseCase mockUpload;
  late MockDeleteImageUseCase mockDelete;

  final tImages = [
    ImageItem(
      id: 'img-1',
      url: 'https://example.com/a.png',
      fileName: 'a.png',
      uploadedAt: DateTime(2026, 1, 1),
    ),
  ];

  setUpAll(() {
    registerFallbackValue(File('/tmp/fallback.png'));
  });

  setUp(() {
    mockWatch = MockWatchImagesUseCase();
    mockUpload = MockUploadImageUseCase();
    mockDelete = MockDeleteImageUseCase();
  });

  ImagesBloc buildBloc() => ImagesBloc(
        watchImagesUseCase: mockWatch,
        uploadImageUseCase: mockUpload,
        deleteImageUseCase: mockDelete,
      );

  group('ImagesBloc — initial state', () {
    blocTest<ImagesBloc, ImagesState>(
      'initial state is ImagesInitial',
      build: buildBloc,
      act: (_) {},
      expect: () => [],
      verify: (bloc) => expect(bloc.state, isA<ImagesInitial>()),
    );
  });

  group('ImagesBloc — WatchImages event', () {
    blocTest<ImagesBloc, ImagesState>(
      'emits ImagesLoading then ImagesLoaded on success',
      build: () {
        when(() => mockWatch())
            .thenAnswer((_) => Stream.fromIterable([Success(tImages)]));
        return buildBloc();
      },
      act: (bloc) => bloc.add(WatchImages()),
      expect: () => [
        isA<ImagesLoading>(),
        ImagesLoaded(tImages),
      ],
    );

    blocTest<ImagesBloc, ImagesState>(
      'emits ImagesError when stream emits Failed(FirestoreFailure)',
      build: () {
        when(() => mockWatch()).thenAnswer(
          (_) => Stream.fromIterable(
            [const Failed(FirestoreFailure('permission-denied'))],
          ),
        );
        return buildBloc();
      },
      act: (bloc) => bloc.add(WatchImages()),
      expect: () => [
        isA<ImagesLoading>(),
        predicate<ImagesState>(
          (s) => s is ImagesError && s.failure is FirestoreFailure,
          'ImagesError with FirestoreFailure',
        ),
      ],
    );
  });

  group('ImagesBloc — UploadImage event', () {
    blocTest<ImagesBloc, ImagesState>(
      'emits ImagesLoaded(isUploading: true) then nothing on success '
      'when grid already loaded',
      seed: () => ImagesLoaded(tImages),
      build: () {
        when(() => mockUpload(any(), any()))
            .thenAnswer((_) async => Success(tImages.first));
        return buildBloc();
      },
      act: (bloc) => bloc.add(UploadImage(File('/tmp/x.png'), 'u1')),
      expect: () => [
        // Toggle the uploading flag on; the stream drives the rest.
        ImagesLoaded(tImages, isUploading: true),
      ],
      verify: (_) {
        verify(() => mockUpload(any(), 'u1')).called(1);
      },
    );

    blocTest<ImagesBloc, ImagesState>(
      'does not toggle isUploading when no grid is loaded yet',
      // From ImagesInitial, the upload branch's `state is ImagesLoaded` guard
      // is false, so the only possible emission on the failure path is the
      // ImagesError. On success there is no emission at all.
      build: () {
        when(() => mockUpload(any(), any()))
            .thenAnswer((_) async => Success(tImages.first));
        return buildBloc();
      },
      act: (bloc) => bloc.add(UploadImage(File('/tmp/x.png'), 'u1')),
      expect: () => [],
    );

    blocTest<ImagesBloc, ImagesState>(
      'emits ImagesError when upload fails',
      build: () {
        when(() => mockUpload(any(), any()))
            .thenAnswer((_) async => const Failed(NetworkFailure()));
        return buildBloc();
      },
      act: (bloc) => bloc.add(UploadImage(File('/tmp/x.png'), 'u1')),
      expect: () => [
        predicate<ImagesState>(
          (s) => s is ImagesError && s.failure is NetworkFailure,
          'ImagesError with NetworkFailure',
        ),
      ],
    );
  });

  group('ImagesBloc — DeleteImage event', () {
    blocTest<ImagesBloc, ImagesState>(
      'does not emit anything on success',
      seed: () => ImagesLoaded(tImages),
      build: () {
        when(() => mockDelete(any(), any(), any()))
            .thenAnswer((_) async => const Success(null));
        return buildBloc();
      },
      act: (bloc) => bloc.add(DeleteImage('img-1', 'a.png', 'u1')),
      expect: () => [],
      verify: (_) => verify(() => mockDelete('img-1', 'a.png', 'u1')).called(1),
    );

    blocTest<ImagesBloc, ImagesState>(
      'emits ImagesError when delete fails',
      build: () {
        when(() => mockDelete(any(), any(), any()))
            .thenAnswer((_) async => const Failed(ServerFailure()));
        return buildBloc();
      },
      act: (bloc) => bloc.add(DeleteImage('img-1', 'a.png', 'u1')),
      expect: () => [
        predicate<ImagesState>(
          (s) => s is ImagesError && s.failure is ServerFailure,
          'ImagesError with ServerFailure',
        ),
      ],
    );
  });
}
