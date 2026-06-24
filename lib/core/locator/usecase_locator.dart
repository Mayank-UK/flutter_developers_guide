import 'package:flutter_developers_guide/core/locator/locator.dart';
import 'package:flutter_developers_guide/domain/repository/auth_repository.dart';
import 'package:flutter_developers_guide/domain/repository/image_repository.dart';
import 'package:flutter_developers_guide/domain/repository/post_repository.dart';
import 'package:flutter_developers_guide/domain/repository/todo_repository.dart';
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

void registerUseCases() {
  locator.registerFactory<SignInUseCase>(
    () => SignInUseCase(
      locator<AuthRepository>(),
    ),
  );

  locator.registerFactory<RegisterUseCase>(
    () => RegisterUseCase(
      locator<AuthRepository>(),
    ),
  );

  locator.registerFactory<AuthStateChangesUseCase>(
    () => AuthStateChangesUseCase(
      locator<AuthRepository>(),
    ),
  );

  locator.registerFactory<SignOutUseCase>(
    () => SignOutUseCase(
      locator<AuthRepository>(),
    ),
  );

  locator.registerFactory<GetPostsUseCase>(
    () => GetPostsUseCase(
      locator<PostRepository>(),
    ),
  );

  locator.registerFactory<AddTodoUseCase>(
    () => AddTodoUseCase(
      locator<TodoRepository>(),
    ),
  );

  locator.registerFactory<DeleteTodoUseCase>(
    () => DeleteTodoUseCase(
      locator<TodoRepository>(),
    ),
  );

  locator.registerFactory<ToggleTodoUseCase>(
    () => ToggleTodoUseCase(
      locator<TodoRepository>(),
    ),
  );

  locator.registerFactory<WatchTodosUseCase>(
    () => WatchTodosUseCase(
      locator<TodoRepository>(),
    ),
  );

  locator.registerFactory<UploadImageUseCase>(
    () => UploadImageUseCase(
      locator<ImageRepository>(),
    ),
  );

  locator.registerFactory<DeleteImageUseCase>(
    () => DeleteImageUseCase(
      locator<ImageRepository>(),
    ),
  );

  locator.registerFactory<WatchImagesUseCase>(
    () => WatchImagesUseCase(
      locator<ImageRepository>(),
    ),
  );
}
