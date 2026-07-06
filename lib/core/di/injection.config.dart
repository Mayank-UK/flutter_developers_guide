// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_analytics/firebase_analytics.dart' as _i398;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logging/logging.dart' as _i831;
import 'package:sqflite/sqlite_api.dart' as _i232;

import '../../data/local/app_database.dart' as _i293;
import '../../data/remote/auth_remote_data_source.dart' as _i804;
import '../../data/remote/failure_injection_interceptor.dart' as _i187;
import '../../data/remote/image_remote_data_source.dart' as _i1062;
import '../../data/remote/post_remote_data_source.dart' as _i696;
import '../../data/remote/todo_remote_data_source.dart' as _i74;
import '../../data/repository_impl/auth_repository_impl.dart' as _i318;
import '../../data/repository_impl/image_repository_impl.dart' as _i241;
import '../../data/repository_impl/post_repository_impl.dart' as _i891;
import '../../data/repository_impl/todo_repository_impl.dart' as _i199;
import '../../domain/repository/auth_repository.dart' as _i614;
import '../../domain/repository/image_repository.dart' as _i169;
import '../../domain/repository/post_repository.dart' as _i368;
import '../../domain/repository/todo_repository.dart' as _i530;
import '../../domain/usecases/auth/auth_state_changes_use_case.dart' as _i556;
import '../../domain/usecases/auth/register_use_case.dart' as _i201;
import '../../domain/usecases/auth/sign_in_use_case.dart' as _i561;
import '../../domain/usecases/auth/signout_use_case.dart' as _i901;
import '../../domain/usecases/get_posts_use_case.dart' as _i160;
import '../../domain/usecases/images/delete_image_use_case.dart' as _i1020;
import '../../domain/usecases/images/upload_image_use_case.dart' as _i996;
import '../../domain/usecases/images/watch_images_use_case.dart' as _i196;
import '../../domain/usecases/todos/add_todo_use_case.dart' as _i261;
import '../../domain/usecases/todos/delete_todo_use_case.dart' as _i912;
import '../../domain/usecases/todos/toggle_todo_use_case.dart' as _i1040;
import '../../domain/usecases/todos/watch_todos_use_case.dart' as _i886;
import '../../ui/blocs/auth/auth_bloc.dart' as _i866;
import '../../ui/blocs/images/images_bloc.dart' as _i298;
import '../../ui/blocs/posts/post_bloc.dart' as _i987;
import '../../ui/blocs/todos/todos_bloc.dart' as _i934;
import '../analytics/analytics_service.dart' as _i726;
import '../config/app_config.dart' as _i650;
import '../connectivity/connectivity_service.dart' as _i528;
import 'injection_module.dart' as _i212;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i59.FirebaseAuth>(() => injectableModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(() => injectableModule.firestore);
    gh.lazySingleton<_i457.FirebaseStorage>(() => injectableModule.storage);
    gh.lazySingleton<_i398.FirebaseAnalytics>(() => injectableModule.analytics);
    gh.lazySingleton<_i187.FailureInjectionInterceptor>(
        () => injectableModule.failureInjectionInterceptor());
    gh.lazySingleton<_i528.ConnectivityService>(
        () => injectableModule.connectivityService());
    gh.lazySingleton<_i726.AnalyticsService>(
        () => injectableModule.analyticsService(gh<_i398.FirebaseAnalytics>()));
    gh.lazySingleton<_i398.FirebaseAnalyticsObserver>(() =>
        injectableModule.analyticsObserver(gh<_i398.FirebaseAnalytics>()));
    gh.lazySingleton<_i1062.ImageRemoteDataSource>(
        () => injectableModule.imageRemoteDataSource(
              gh<_i650.AppConfig>(),
              gh<_i974.FirebaseFirestore>(),
              gh<_i457.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i831.Logger>(
        () => injectableModule.logger(gh<_i650.AppConfig>()));
    gh.lazySingleton<_i74.TodoRemoteDataSource>(
        () => injectableModule.todoRemoteDataSource(
              gh<_i650.AppConfig>(),
              gh<_i974.FirebaseFirestore>(),
            ));
    gh.lazySingleton<_i530.TodoRepository>(() => _i199.TodoRepositoryImpl(
          remoteDataSource: gh<_i74.TodoRemoteDataSource>(),
          logger: gh<_i831.Logger>(),
          analytics: gh<_i726.AnalyticsService>(),
        ));
    gh.lazySingleton<_i804.AuthRemoteDataSource>(
        () => injectableModule.authRemoteDataSource(
              gh<_i650.AppConfig>(),
              gh<_i831.Logger>(),
              gh<_i59.FirebaseAuth>(),
            ));
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dio(
          gh<_i650.AppConfig>(),
          gh<_i59.FirebaseAuth>(),
          gh<_i187.FailureInjectionInterceptor>(),
        ));
    gh.lazySingleton<_i293.AppDatabase>(() => injectableModule.appDatabase(
          gh<_i650.AppConfig>(),
          gh<_i232.Database>(),
        ));
    gh.lazySingleton<_i169.ImageRepository>(() => _i241.ImageRepositoryImpl(
          remoteDataSource: gh<_i1062.ImageRemoteDataSource>(),
          logger: gh<_i831.Logger>(),
          analytics: gh<_i726.AnalyticsService>(),
        ));
    gh.lazySingleton<_i696.PostRemoteDataSource>(
        () => injectableModule.postRemoteDataSource(gh<_i361.Dio>()));
    gh.factory<_i1020.DeleteImageUseCase>(
        () => _i1020.DeleteImageUseCase(gh<_i169.ImageRepository>()));
    gh.factory<_i996.UploadImageUseCase>(
        () => _i996.UploadImageUseCase(gh<_i169.ImageRepository>()));
    gh.factory<_i196.WatchImagesUseCase>(
        () => _i196.WatchImagesUseCase(gh<_i169.ImageRepository>()));
    gh.factory<_i261.AddTodoUseCase>(
        () => _i261.AddTodoUseCase(gh<_i530.TodoRepository>()));
    gh.factory<_i912.DeleteTodoUseCase>(
        () => _i912.DeleteTodoUseCase(gh<_i530.TodoRepository>()));
    gh.factory<_i1040.ToggleTodoUseCase>(
        () => _i1040.ToggleTodoUseCase(gh<_i530.TodoRepository>()));
    gh.factory<_i886.WatchTodosUseCase>(
        () => _i886.WatchTodosUseCase(gh<_i530.TodoRepository>()));
    gh.lazySingleton<_i614.AuthRepository>(() => _i318.AuthRepositoryImpl(
          remoteDataSource: gh<_i804.AuthRemoteDataSource>(),
          logger: gh<_i831.Logger>(),
          analytics: gh<_i726.AnalyticsService>(),
        ));
    gh.factory<_i298.ImagesBloc>(() => _i298.ImagesBloc(
          watchImagesUseCase: gh<_i196.WatchImagesUseCase>(),
          uploadImageUseCase: gh<_i996.UploadImageUseCase>(),
          deleteImageUseCase: gh<_i1020.DeleteImageUseCase>(),
        ));
    gh.factory<_i934.TodosBloc>(() => _i934.TodosBloc(
          watchTodosUseCase: gh<_i886.WatchTodosUseCase>(),
          addTodoUseCase: gh<_i261.AddTodoUseCase>(),
          toggleTodoUseCase: gh<_i1040.ToggleTodoUseCase>(),
          deleteTodoUseCase: gh<_i912.DeleteTodoUseCase>(),
        ));
    gh.lazySingleton<_i368.PostRepository>(() => _i891.PostRepositoryImpl(
          remoteDataSource: gh<_i696.PostRemoteDataSource>(),
          localDataSource: gh<_i293.AppDatabase>(),
          logger: gh<_i831.Logger>(),
        ));
    gh.factory<_i556.AuthStateChangesUseCase>(
        () => _i556.AuthStateChangesUseCase(gh<_i614.AuthRepository>()));
    gh.factory<_i201.RegisterUseCase>(
        () => _i201.RegisterUseCase(gh<_i614.AuthRepository>()));
    gh.factory<_i561.SignInUseCase>(
        () => _i561.SignInUseCase(gh<_i614.AuthRepository>()));
    gh.factory<_i901.SignOutUseCase>(
        () => _i901.SignOutUseCase(gh<_i614.AuthRepository>()));
    gh.factory<_i160.GetPostsUseCase>(
        () => _i160.GetPostsUseCase(gh<_i368.PostRepository>()));
    gh.factory<_i866.AuthBloc>(() => _i866.AuthBloc(
          signInUseCase: gh<_i561.SignInUseCase>(),
          registerUseCase: gh<_i201.RegisterUseCase>(),
          signOutUseCase: gh<_i901.SignOutUseCase>(),
          authStateChangesUseCase: gh<_i556.AuthStateChangesUseCase>(),
        ));
    gh.factory<_i987.PostsBloc>(
        () => _i987.PostsBloc(getPostsUseCase: gh<_i160.GetPostsUseCase>()));
    return this;
  }
}

class _$InjectableModule extends _i212.InjectableModule {}
