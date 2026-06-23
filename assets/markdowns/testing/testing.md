## api_service_test.dart

    // --- Mocks ---
    class MockHttpClient extends Mock implements http.Client {}

    class MockAppConfig extends Mock implements AppConfig {}

    void main() {
        late MockHttpClient mockClient;
        late MockAppConfig mockConfig;
        late ApiServiceImpl apiService;

        // A valid JSON list that maps to PostDTO
        final tPostsJson = jsonEncode([
            {'id': 1, 'title': 'Test Post', 'body': 'Test Body'},
        ]);

        setUp(() {
            mockClient = MockHttpClient();
            mockConfig = MockAppConfig();

            when(() => mockConfig.baseUrl).thenReturn('https://fake.api');

            apiService = ApiServiceImpl(
            client: mockClient,
            config: mockConfig,
            logger: Logger('test'),
            );

            // Required by mocktail: register fallback for Uri
            registerFallbackValue(Uri.parse(''));
        });

        group('ApiServiceImpl.getPosts', () {
            test('returns list of PostDTO on 200 response', () async {
            when(() => mockClient.get(any())).thenAnswer(
                (_) async => http.Response(tPostsJson, 200),
            );

            final result = await apiService.getPosts();

            expect(result.length, 1);
            expect(result.first.id, 1);
            expect(result.first.title, 'Test Post');
            });

            test('throws ServerException on non-200 status code', () async {
            when(() => mockClient.get(any())).thenAnswer(
                (_) async => http.Response('Internal Server Error', 500),
            );

            expect(() => apiService.getPosts(), throwsA(isA<ServerException>()));
            });

            test('throws NetworkException on SocketException', () async {
            when(() => mockClient.get(any())).thenThrow(
                const SocketException('No network'),
            );

            expect(() => apiService.getPosts(), throwsA(isA<NetworkException>()));
            });

            test('throws NetworkException on TimeoutException', () async {
            when(() => mockClient.get(any())).thenThrow(
                TimeoutException('Timed out'),
            );

            expect(() => apiService.getPosts(), throwsA(isA<NetworkException>()));
            });

            test('throws ServerException on FormatException (invalid JSON)', () async {
            when(() => mockClient.get(any())).thenAnswer(
                (_) async => http.Response('not valid json', 200),
            );

            expect(() => apiService.getPosts(), throwsA(isA<ServerException>()));
            });
        });
    }

## post_repository_impl_test.dart
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

## posts_bloc_test.dart
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

