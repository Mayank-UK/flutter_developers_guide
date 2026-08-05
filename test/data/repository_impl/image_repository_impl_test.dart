import 'dart:io';

import 'package:flutter_developers_guide/core/analytics/analytics_service.dart';
import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/data/remote/dtos/image_item_dto.dart';
import 'package:flutter_developers_guide/data/remote/image_remote_data_source.dart';
import 'package:flutter_developers_guide/data/repository_impl/image_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';
import 'package:mocktail/mocktail.dart';

// --- Mocks ---
class MockImageRemoteDataSource extends Mock
    implements ImageRemoteDataSource {}

class MockAnalyticsService extends Mock implements AnalyticsService {}

// --- Helpers ---
final tImageDto = ImageItemDto(
  id: 'img-1',
  url: 'https://example.com/img.png',
  fileName: 'img.png',
  uploadedAt: DateTime(2026, 1, 1),
);

void main() {
  late MockImageRemoteDataSource mockRemote;
  late MockAnalyticsService mockAnalytics;
  late ImageRepositoryImpl repository;

  setUpAll(() {
    // mocktail needs a concrete fallback for any File argument matcher.
    registerFallbackValue(File('/tmp/fallback.png'));
  });

  setUp(() {
    mockRemote = MockImageRemoteDataSource();
    mockAnalytics = MockAnalyticsService();

    when(() => mockAnalytics.logImageUploaded()).thenAnswer((_) async {});
    when(() => mockAnalytics.logImageDeleted()).thenAnswer((_) async {});

    repository = ImageRepositoryImpl(
      remoteDataSource: mockRemote,
      logger: Logger('test'),
      analytics: mockAnalytics,
    );
  });

  group('ImageRepositoryImpl.uploadImage', () {
    test('returns Success(ImageItem) and logs analytics on success', () async {
      when(() => mockRemote.uploadImage(any(), any()))
          .thenAnswer((_) async => tImageDto);

      final result = await repository.uploadImage(File('/tmp/x.png'), 'u1');

      expect(result, isA<Success>());
      final image = (result as Success).value;
      expect(image.id, 'img-1');
      expect(image.url, 'https://example.com/img.png');
      verify(() => mockAnalytics.logImageUploaded()).called(1);
    });

    test('returns Failed(FirestoreFailure) on FirebaseFirestoreException',
        () async {
      when(() => mockRemote.uploadImage(any(), any()))
          .thenThrow(const FirebaseFirestoreException('permission-denied'));

      final result = await repository.uploadImage(File('/tmp/x.png'), 'u1');

      expect(result, isA<Failed>());
      expect((result as Failed).failure, isA<FirestoreFailure>());
      verifyNever(() => mockAnalytics.logImageUploaded());
    });

    test('returns Failed(NetworkFailure) on NetworkException', () async {
      when(() => mockRemote.uploadImage(any(), any()))
          .thenThrow(const NetworkException('offline'));

      final result = await repository.uploadImage(File('/tmp/x.png'), 'u1');

      expect(result, isA<Failed>());
      expect((result as Failed).failure, isA<NetworkFailure>());
    });
  });

  group('ImageRepositoryImpl.deleteImage', () {
    test('returns Success and logs analytics on success', () async {
      when(() => mockRemote.deleteImage(any(), any(), any()))
          .thenAnswer((_) async {});

      final result = await repository.deleteImage('img-1', 'img.png', 'u1');

      expect(result, isA<Success>());
      verify(() => mockAnalytics.logImageDeleted()).called(1);
    });

    test('returns Failed(ServerFailure) when remote throws ServerException',
        () async {
      when(() => mockRemote.deleteImage(any(), any(), any()))
          .thenThrow(const ServerException('boom'));

      final result = await repository.deleteImage('img-1', 'img.png', 'u1');

      expect(result, isA<Failed>());
      expect((result as Failed).failure, isA<ServerFailure>());
      verifyNever(() => mockAnalytics.logImageDeleted());
    });
  });

  group('ImageRepositoryImpl.watchImages', () {
    test('emits Success(mapped ImageItems) for each upstream emission',
        () async {
      when(() => mockRemote.watchImages()).thenAnswer(
        (_) => Stream.fromIterable([
          [tImageDto],
          [],
        ]),
      );

      final results = await repository.watchImages().toList();

      expect(results.length, 2);
      expect(results.first, isA<Success<List>>());
      expect((results.first as Success).value.first.id, 'img-1');
      expect((results.last as Success).value, isEmpty);
    });

    test('emits Failed(FirestoreFailure) when upstream stream errors',
        () async {
      when(() => mockRemote.watchImages()).thenAnswer(
        (_) => Stream<List<ImageItemDto>>.error(
          const FirebaseFirestoreException('permission-denied'),
        ),
      );

      final results = await repository.watchImages().toList();

      expect(results.length, 1);
      expect(results.first, isA<Failed<List>>());
      expect((results.first as Failed).failure, isA<FirestoreFailure>());
    });

    test('emits Failed(ServerFailure) for unexpected stream errors', () async {
      // guardedStream wraps non-AppException stream errors as
      // ServerException('Stream error') → ServerFailure.
      when(() => mockRemote.watchImages()).thenAnswer(
        (_) =>
            Stream<List<ImageItemDto>>.error(FormatException('bad data')),
      );

      final results = await repository.watchImages().toList();

      expect(results.length, 1);
      expect(results.first, isA<Failed<List>>());
      expect((results.first as Failed).failure, isA<ServerFailure>());
    });
  });
}
