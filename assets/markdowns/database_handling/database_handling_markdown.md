## include required plugins in pubspec.yaml

    sqflite

## exampleDao.dart

    class PostDAO {
        final Database _database;

        PostDAO({required Database database}) : _database = database;

        Future<void> insertPost(PostDTO post) async {
            try {
            await _database.insert(
                'posts',
                post.toJson(),
                conflictAlgorithm: ConflictAlgorithm.replace,
            );
            } catch (e, stackTrace) {
            print('Error inserting post: $e');
            print(stackTrace);
            throw AppDatabaseException('Failed to insert post: $e');
            }
        }

        Future<List<PostDTO>> getAllPosts() async {
            try {
            final List<Map<String, dynamic>> maps = await _database.query('posts');
            return List.generate(maps.length, (i) {
                return PostDTO.fromJson(maps[i]);
            });
            } catch (e, stackTrace) {
            print('Error getting posts: $e');
            print(stackTrace);
            throw AppDatabaseException('Failed to get posts: $e');
            }
        }

        Future<PostDTO?> getPost(int id) async {
            try {
                final List<Map<String, dynamic>> maps = await _database.query(
                    'posts',
                    where: 'id = ?',
                    whereArgs: [id],
                );

                if (maps.isNotEmpty) {
                    return PostDTO.fromJson(maps.first);
                }

                return null;

            } catch (e, stackTrace) {
                print('Error getting post: $e');
                print(stackTrace);
                throw AppDatabaseException('Failed to get post: $e');

            }
        }
    }

## appDatabase.dart

    abstract class AppDatabase {
        Future<void> insertPosts(List<PostDTO> posts);
        Future<List<PostDTO>> getPosts();
    }

    class AppDatabaseImpl implements AppDatabase {
        final PostDAO _postDAO;

        AppDatabaseImpl({required PostDAO postDAO}) : _postDAO = postDAO;

        @override
        Future<void> insertPosts(List<PostDTO> posts) async {
            for (var post in posts) {
                await _postDAO.insertPost(post);
            }
        }

        @override
        Future<List<PostDTO>> getPosts() async {
                return await _postDAO.getAllPosts();
        }
    }

    class DatabaseProvider {
        static const String _databaseName = 'app_database.db';
        static const int _databaseVersion = 1;

        static Database? _database;

        static Future<Database> get database async {
            if (_database != null) return _database!;
            _database = await _initDatabase();
            return _database!;
        }

        static Future<Database> _initDatabase() async {
            final path = join(await getDatabasesPath(), _databaseName);
            return await openDatabase(path,
                onCreate: _onCreate, version: _databaseVersion);
        }

        static Future<void> _onCreate(Database db, int version) async {
            await db.execute(
                'CREATE TABLE posts(id INTEGER PRIMARY KEY, title TEXT, body TEXT)');
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
