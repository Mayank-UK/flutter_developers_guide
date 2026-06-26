import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/domain/models/post.dart';
import 'package:flutter_developers_guide/domain/usecases/get_posts_use_case.dart';
import 'package:flutter_developers_guide/ui/state_management/blocs/posts/post_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// --- Mock ---
class MockGetPostsUseCase extends Mock implements GetPostsUseCase {}

void main() {
  late MockGetPostsUseCase mockUseCase;

  final tPosts = [Post(id: 1, title: 'Post', body: 'Body')];

  setUp(() {
    mockUseCase = MockGetPostsUseCase();
  });

  // bloc_test's blocTest<B, S> helper gives you a clean
  // build / act / expect / verify structure per scenario.
  // Each call creates a fresh bloc instance — no shared state between tests.

  group('PostsBloc — FetchPosts event', () {
    blocTest<PostsBloc, PostsState>(
      'emits [PostsLoading, PostsLoaded] on successful fetch',
      build: () {
        when(() => mockUseCase()).thenAnswer((_) async => Success(tPosts));
        return PostsBloc(getPostsUseCase: mockUseCase);
      },
      act: (bloc) => bloc.add(FetchPosts()),
      expect: () => [
        isA<PostsLoading>(),
        isA<PostsLoaded>(),
      ],
      verify: (_) {
        verify(() => mockUseCase()).called(1);
      },
    );

    blocTest<PostsBloc, PostsState>(
      'PostsLoaded contains the correct posts',
      build: () {
        when(() => mockUseCase()).thenAnswer((_) async => Success(tPosts));
        return PostsBloc(getPostsUseCase: mockUseCase);
      },
      act: (bloc) => bloc.add(FetchPosts()),
      expect: () => [
        isA<PostsLoading>(),
        PostsLoaded(tPosts), // Equatable makes this value-equal
      ],
    );

    blocTest<PostsBloc, PostsState>(
      'emits [PostsLoading, PostsError] on NetworkFailure',
      build: () {
        when(() => mockUseCase()).thenAnswer(
          (_) async => const Failed(NetworkFailure()),
        );
        return PostsBloc(getPostsUseCase: mockUseCase);
      },
      act: (bloc) => bloc.add(FetchPosts()),
      expect: () => [
        isA<PostsLoading>(),
        isA<PostsError>(),
      ],
    );

    blocTest<PostsBloc, PostsState>(
      'PostsError carries the correct failure type on NetworkFailure',
      build: () {
        when(() => mockUseCase()).thenAnswer(
          (_) async => const Failed(NetworkFailure()),
        );
        return PostsBloc(getPostsUseCase: mockUseCase);
      },
      act: (bloc) => bloc.add(FetchPosts()),
      expect: () => [
        isA<PostsLoading>(),
        predicate<PostsState>(
          (s) => s is PostsError && s.failure is NetworkFailure,
          'PostsError with NetworkFailure',
        ),
      ],
    );

    blocTest<PostsBloc, PostsState>(
      'emits [PostsLoading, PostsError] on ServerFailure',
      build: () {
        when(() => mockUseCase()).thenAnswer(
          (_) async => const Failed(ServerFailure()),
        );
        return PostsBloc(getPostsUseCase: mockUseCase);
      },
      act: (bloc) => bloc.add(FetchPosts()),
      expect: () => [
        isA<PostsLoading>(),
        isA<PostsError>(),
      ],
    );

    blocTest<PostsBloc, PostsState>(
      'emits [PostsLoading, PostsError] on CacheFailure (both remote and cache failed)',
      build: () {
        when(() => mockUseCase()).thenAnswer(
          (_) async => const Failed(
            CacheFailure('No cached data available', NetworkFailure()),
          ),
        );
        return PostsBloc(getPostsUseCase: mockUseCase);
      },
      act: (bloc) => bloc.add(FetchPosts()),
      expect: () => [
        isA<PostsLoading>(),
        predicate<PostsState>(
          (s) => s is PostsError && s.failure is CacheFailure && s.failure.cause is NetworkFailure,
          'PostsError with chained CacheFailure → NetworkFailure',
        ),
      ],
    );

    blocTest<PostsBloc, PostsState>(
      'initial state is PostsInitial',
      build: () => PostsBloc(getPostsUseCase: mockUseCase),
      act: (_) {}, // no event dispatched
      expect: () => [], // no state change
      verify: (bloc) {
        expect(bloc.state, isA<PostsInitial>());
      },
    );
  });
}
