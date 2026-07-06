import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/domain/models/post.dart';
import 'package:flutter_developers_guide/domain/usecases/get_posts_use_case.dart';
import 'package:injectable/injectable.dart';

// Events
sealed class PostsEvent {}

class FetchPosts extends PostsEvent {}

// States
/* 
Equatable package and is used to make object comparison based on values instead of memory addresses.
Without Equitable
  final state1 = PostsLoaded([]);
  final state2 = PostsLoaded([]);

  print(state1 == state2); // false

With Equatable
  final state1 = PostsLoaded([]);
  final state2 = PostsLoaded([]);

  print(state1 == state2); // true
*/
sealed class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object?> get props => [];
}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<Post> posts;
  final Failure? warning;

  const PostsLoaded(
    this.posts, {
    this.warning,
  });

  @override
  List<Object?> get props => [
        posts,
        warning,
      ];
}

class PostsError extends PostsState {
  final Failure failure;
  const PostsError(this.failure);

  @override
  List<Object?> get props => [failure];
}

// BLoC
@injectable
class PostsBloc extends Bloc<PostsEvent, PostsState> {
  // In clean architecture, every useCase is injected individually, so in future if there is requirement for remove pose use case, it will be injected separately
  final GetPostsUseCase getPostsUseCase;

  PostsBloc({
    required this.getPostsUseCase,
  }) : super(PostsInitial()) {
    on<FetchPosts>((event, emit) async {
      emit(PostsLoading());
      final result = await getPostsUseCase();

      // Why error handling is required in block when it is already done in apiService and repository?
      // This is because every stage is handling errors related to it, bloc will receive exceptions that have occured
      // at various stages and help convert those exceptions and failures to store in states and show via UI
      // switch (result) {
      //   case Success(value: final posts):
      //     emit(PostsLoaded(posts));
      //   case Failed(failure: final failure):
      //     emit(PostsError(failure));
      // }

      switch (result) {
        case Success(
            value: final posts,
            warning: final warning,
          ):
          emit(
            PostsLoaded(
              posts,
              warning: warning,
            ),
          );

        case Failed(failure: final failure):
          emit(PostsError(failure));
      }
    });
  }
}
