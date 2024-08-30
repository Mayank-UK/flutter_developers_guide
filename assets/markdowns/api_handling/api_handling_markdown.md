## ## include required plugins in pubspec.yaml

    http

## exampleDto.dart

    class PostDTO {
        final int id;
        final String title;
        final String body;

        PostDTO({required this.id, required this.title, required this.body});

        factory PostDTO.fromJson(Map<String, dynamic> json) {
            return PostDTO(
            id: json['id'],
            title: json['title'],
            body: json['body'],
            );
        }

        Map<String, dynamic> toJson() {
            return {
            'id': id,
            'title': title,
            'body': body,
            };
        }

        Post toPost() {
            return Post(id: id, title: title, body: body);
        }

        static PostDTO fromPost(Post post) {
            return PostDTO(id: post.id, title: post.title, body: post.body);
        }
    }

## apiService.dart

    abstract class ApiService {
        Future<List<PostDTO>> getPosts();
    }

    class ApiServiceImpl implements ApiService {
        final http.Client client;
        final String baseUrl = 'https://jsonplaceholder.typicode.com';

        ApiServiceImpl({required this.client});

        @override
        Future<List<PostDTO>> getPosts() async {
        final response = await client.get(Uri.parse('$baseUrl/posts'));

            if (response.statusCode == 200) {
                final List<dynamic> jsonList = json.decode(response.body);
                return jsonList.map((json) => PostDTO.fromJson(json)).toList();
            } else {
                throw Exception('Failed to load posts');
            }

        }
    }

## repository interface

    abstract class PostRepository {
        Future<List<Post>> getPosts();
    }

## repository implementation

    class PostRepositoryImpl implements PostRepository {
        final ApiService remoteDataSource;
        final AppDatabase localDataSource;

        PostRepositoryImpl({
            required this.remoteDataSource,
            required this.localDataSource,
        });

        @override
        Future<List<Post>> getPosts() async {
            try {
                final remotePosts = await remoteDataSource.getPosts();
                await localDataSource.insertPosts(remotePosts);
                return remotePosts.map((dto) => dto.toPost()).toList();
            } catch (e) {
                try {
                    final localPosts = await localDataSource.getPosts();
                    return localPosts.map((dto) => dto.toPost()).toList();
                } on DatabaseException {
                    throw RepositoryException(
                        'Failed to fetch posts from both remote and local sources');
                }
            }
        }
    }

## exceptions.dart

    class AppDatabaseException implements Exception {
        final String message;
        AppDatabaseException(this.message);
        @override
        String toString() => 'DatabaseException: $message';
    }

    class RepositoryException implements Exception {
        final String message;
        RepositoryException(this.message);

        @override
        String toString() => 'RepositoryException: $message';
    }

    class UseCaseException implements Exception {
        final String message;
        UseCaseException(this.message);

        @override
        String toString() => 'UseCaseException: $message';
    }

## example usecase.dart

    class GetPostsUseCase {
        final PostRepository repository;

        GetPostsUseCase(this.repository);

        Future<List<Post>> call() async {
            try {
                return await repository.getPosts();
            } catch (e) {
                throw UseCaseException('Failed to get posts: $e');
            }
        }
    }

## example model

    class Post {
        final int id;
        final String title;
        final String body;

        Post({required this.id, required this.title, required this.body});
    }

## example bloc

    // Events
    abstract class PostsEvent {}

    class FetchPosts extends PostsEvent {}

    // States
    abstract class PostsState {}

    class PostsInitial extends PostsState {}

    class PostsLoading extends PostsState {}

    class PostsLoaded extends PostsState {
        final List<Post> posts;

        PostsLoaded(this.posts);
    }

    class PostsError extends PostsState {
        final String message;

        PostsError(this.message);
    }

    // BLoC
    class PostsBloc extends Bloc<PostsEvent, PostsState> {
        final GetPostsUseCase getPostsUseCase;

        PostsBloc({required this.getPostsUseCase}) : super(PostsInitial()) {
            on<FetchPosts>((event, emit) async {
                emit(PostsLoading());
                try {
                    final posts = await getPostsUseCase();
                    emit(PostsLoaded(posts));
                } catch (e) {
                    emit(PostsError(e.toString()));
                }
            });
        }
    }

## example screen

    class PostsAppView extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            return PageScaffold(
                title: "Posts",
                mobileUi: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: BlocBuilder<PostsBloc, PostsState>(
                            builder: (context, state) {
                            if (state is PostsInitial) {
                                BlocProvider.of<PostsBloc>(context).add(FetchPosts());
                                return Center(child: CircularProgressIndicator());
                            } else if (state is PostsLoading) {
                                return Center(child: CircularProgressIndicator());
                            } else if (state is PostsLoaded) {
                                return ListView.builder(
                                itemCount: state.posts.length,
                                itemBuilder: (context, index) {
                                    final post = state.posts[index];
                                    return ListTile(
                                    title: Text(post.title),
                                    subtitle: Text(post.body),
                                    );
                                },
                                );
                            } else if (state is PostsError) {
                                return Center(child: Text('Error: ${state.message}'));
                            }

                            return Container();
                            },
                        ),
                    )
                ],
            );
        }
    }
