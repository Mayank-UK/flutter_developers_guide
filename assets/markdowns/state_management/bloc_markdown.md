## bloc file

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

## view file

  class PostsAppView extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return PageScaffold(
        title: "Posts",
        children: [
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
