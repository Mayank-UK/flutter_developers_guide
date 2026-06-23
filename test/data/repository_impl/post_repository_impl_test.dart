import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/data/local/app_database.dart';
import 'package:flutter_developers_guide/data/remote/api_service.dart';
import 'package:flutter_developers_guide/data/remote/dtos/post_dto.dart';
import 'package:flutter_developers_guide/data/repository_impl/post_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';
import 'package:mocktail/mocktail.dart';

// --- Mocks ---
class MockApiService extends Mock implements ApiService {}

class MockAppDatabase extends Mock implements AppDatabase {}

// --- Helpers ---

// A minimal PostDTO stub. Adjust fields to match your actual PostDTO.
final tPostDTO = PostDTO(id: 1, title: 'Remote Post', body: 'Body');

// A PostDTO returned from the local cache
final tCachedPostDTO = PostDTO(id: 2, title: 'Cached Post', body: 'Cached Body');

void main() {
  late MockApiService mockApiService;
  late MockAppDatabase mockDatabase;
  late PostRepositoryImpl repository;

  setUp(() {
    mockApiService = MockApiService();
    mockDatabase = MockAppDatabase();

    repository = PostRepositoryImpl(
      remoteDataSource: mockApiService,
      localDataSource: mockDatabase,
      logger: Logger('test'),
    );
  });

  group('PostRepositoryImpl.getPosts', () {
    // --- Happy path ---

    test('returns Success with mapped posts when remote call succeeds', () async {
      when(() => mockApiService.getPosts()).thenAnswer((_) async => [tPostDTO]);
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
      when(() => mockApiService.getPosts()).thenAnswer((_) async => [tPostDTO]);
      when(() => mockDatabase.insertPosts(any())).thenThrow(Exception('disk full'));

      final result = await repository.getPosts();

      // The cache write failure is swallowed — remote data still wins
      expect(result, isA<Success<List>>());
    });

    // --- Network fallback ---

    test('falls back to cache and returns Success on NetworkException', () async {
      when(() => mockApiService.getPosts()).thenThrow(const NetworkException());
      when(() => mockDatabase.getPosts()).thenAnswer((_) async => [tCachedPostDTO]);

      final result = await repository.getPosts();

      expect(result, isA<Success<List>>());
      final posts = (result as Success).value;
      expect(posts.first.title, 'Cached Post');
    });

    test('falls back to cache and returns Success on ServerException', () async {
      when(() => mockApiService.getPosts()).thenThrow(const ServerException());
      when(() => mockDatabase.getPosts()).thenAnswer((_) async => [tCachedPostDTO]);

      final result = await repository.getPosts();

      expect(result, isA<Success<List>>());
    });

    // --- Double failure (remote + cache) ---

    test(
      'returns Failed(CacheFailure) with chained cause when both remote and cache fail',
      () async {
        when(() => mockApiService.getPosts()).thenThrow(const NetworkException());
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
        when(() => mockApiService.getPosts()).thenThrow(
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
