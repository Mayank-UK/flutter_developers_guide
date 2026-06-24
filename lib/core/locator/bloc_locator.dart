import 'package:flutter_developers_guide/core/locator/locator.dart';
import 'package:flutter_developers_guide/domain/usecases/auth/auth_state_changes_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/auth/register_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/auth/sign_in_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/auth/signout_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/get_posts_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/images/delete_image_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/images/upload_image_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/images/watch_images_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/todos/add_todo_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/todos/delete_todo_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/todos/toggle_todo_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/todos/watch_todos_use_case.dart';
import 'package:flutter_developers_guide/ui/blocs/auth/auth_bloc.dart';
import 'package:flutter_developers_guide/ui/blocs/images/images_bloc.dart';
import 'package:flutter_developers_guide/ui/blocs/posts/post_bloc.dart';
import 'package:flutter_developers_guide/ui/blocs/todos/todos_bloc.dart';

void registerBlocs() {
  locator.registerFactory<PostsBloc>(
    () => PostsBloc(
      getPostsUseCase: locator<GetPostsUseCase>(),
    ),
  );

  locator.registerFactory<AuthBloc>(
    () => AuthBloc(
      signInUseCase: locator<SignInUseCase>(),
      registerUseCase: locator<RegisterUseCase>(),
      signOutUseCase: locator<SignOutUseCase>(),
      authStateChangesUseCase: locator<AuthStateChangesUseCase>(),
    ),
  );

  locator.registerFactory<TodosBloc>(
    () => TodosBloc(
      addTodoUseCase: locator<AddTodoUseCase>(),
      deleteTodoUseCase: locator<DeleteTodoUseCase>(),
      toggleTodoUseCase: locator<ToggleTodoUseCase>(),
      watchTodosUseCase: locator<WatchTodosUseCase>(),
    ),
  );

  locator.registerFactory<ImagesBloc>(
    () => ImagesBloc(
      watchImagesUseCase: locator<WatchImagesUseCase>(),
      uploadImageUseCase: locator<UploadImageUseCase>(),
      deleteImageUseCase: locator<DeleteImageUseCase>(),
    ),
  );
}
