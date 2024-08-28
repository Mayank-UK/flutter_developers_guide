import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_developers_guide/domain/models/post.dart';
import 'package:flutter_developers_guide/domain/usecases/get_posts_use_case.dart';

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
