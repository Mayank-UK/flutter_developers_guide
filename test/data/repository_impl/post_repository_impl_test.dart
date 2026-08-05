import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/data/local/app_database.dart';
import 'package:flutter_developers_guide/data/remote/dtos/post_dto.dart';
import 'package:flutter_developers_guide/data/remote/post_remote_data_source.dart';
import 'package:flutter_developers_guide/data/repository_impl/post_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';
import 'package:mocktail/mocktail.dart';

// --- Mocks ---
class MockPostRemoteDataSource extends Mock implements PostRemoteDataSource {}

class MockAppDatabase extends Mock implements AppDatabase {}

// --- Helpers ---

// A minimal PostDto stub. Adjust fields to match your actual PostDto.
final tPostDto = PostDto(id: 1, title: 'Remote Post', body: 'Body');

// A PostDto returned from the local cache
final tCachedPostDto =
    PostDto(id: 2, title: 'Cached Post', body: 'Cached Body');

void main() {
  late MockPostRemoteDataSource mockRemoteDataSource;
  late MockAppDatabase mockDatabase;
  late PostRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockPostRemoteDataSource();
    mockDatabase = MockAppDatabase();

    repository = PostRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockDatabase,
      logger: Logger('test'),
    );
  });

  group('PostRepositoryImpl.getPosts', () {
    // --- Happy path ---

    test('returns Success with mapped posts when remote call succeeds',
        () async {
      when(() => mockRemoteDataSource.getPosts())
          .thenAnswer((_) async => [tPostDto]);
      when(() => mockDatabase.insertPosts(any())).thenAnswer((_) async {});

      final result = await repository.getPosts();

      expect(result, isA<Success<List>>());
      final posts = (result as Success).value;
      expect(posts.length, 1);
      expect(posts.first.title, 'Remote Post');

      // Verify that we attempted to cache the result
      verify(() => mockDatabase.insertPosts(any())).called(1);
    });

    test('still returns Success even when local cache write fails', () async {
      when(() => mockRemoteDataSource.getPosts())
          .thenAnswer((_) async => [tPostDto]);
      when(() => mockDatabase.insertPosts(any()))
          .thenThrow(Exception('disk full'));

      final result = await repository.getPosts();

      // The cache write failure is swallowed — remote data still wins
      expect(result, isA<Success<List>>());
    });

    // --- Network fallback ---

    test('falls back to cache and returns Success on NetworkException',
        () async {
      when(() => mockRemoteDataSource.getPosts())
          .thenThrow(const NetworkException());
      when(() => mockDatabase.getPosts())
          .thenAnswer((_) async => [tCachedPostDto]);

      final result = await repository.getPosts();

      expect(result, isA<Success<List>>());
      final posts = (result as Success).value;
      expect(posts.first.title, 'Cached Post');
    });

    test('falls back to cache and returns Success on ServerException',
        () async {
      when(() => mockRemoteDataSource.getPosts())
          .thenThrow(const ServerException());
      when(() => mockDatabase.getPosts())
          .thenAnswer((_) async => [tCachedPostDto]);

      final result = await repository.getPosts();

      expect(result, isA<Success<List>>());
    });

    // --- Double failure (remote + cache) ---

    test(
      'returns Failed(CacheFailure) with chained cause when both remote and cache fail',
      () async {
        when(() => mockRemoteDataSource.getPosts())
            .thenThrow(const NetworkException());
        when(() => mockDatabase.getPosts()).thenThrow(
          const AppDatabaseException('No rows'),
        );

        final result = await repository.getPosts();

        expect(result, isA<Failed<List>>());
        final failure = (result as Failed).failure;

        // The outer failure must be CacheFailure (the DB layer)
        expect(failure, isA<CacheFailure>());

        // The inner cause must be the original NetworkFailure
        expect(failure.cause, isA<NetworkFailure>());
      },
    );

    test(
      'chained failure message includes both failure descriptions',
      () async {
        when(() => mockRemoteDataSource.getPosts()).thenThrow(
          const NetworkException('No internet connection'),
        );
        when(() => mockDatabase.getPosts()).thenThrow(
          const AppDatabaseException('No cached data available'),
        );

        final result = await repository.getPosts();
        final failure = (result as Failed).failure;

        // message builds as: cause.message + ' + ' + rawMessage
        expect(failure.message, contains('No internet connection'));
        expect(failure.message, contains('No cached data available'));
      },
    );
  });
}
