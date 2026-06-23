// this file uses get_it package, this package enables us to implement
// design patterns like singleton, factory, etc easily

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_developers_guide/core/config/app_config.dart';
import 'package:flutter_developers_guide/data/local/fake_app_database.dart';
import 'package:flutter_developers_guide/data/remote/fake_api_service.dart';
import 'package:flutter_developers_guide/data/repository_impl/auth_repository_impl.dart';
import 'package:flutter_developers_guide/domain/repository/auth_repository.dart';
import 'package:flutter_developers_guide/domain/usecases/auth/auth_state_changes_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/auth/register_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/auth/sign_in_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/auth/signout_use_case.dart';
import 'package:flutter_developers_guide/ui/blocs/auth/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:sqflite/sqlite_api.dart';

import 'package:flutter_developers_guide/data/local/app_database.dart';
import 'package:flutter_developers_guide/data/local/daos/post_dao.dart';
import 'package:flutter_developers_guide/data/remote/api_service.dart';
import 'package:flutter_developers_guide/data/repository_impl/post_repository_impl.dart';
import 'package:flutter_developers_guide/domain/repository/post_repository.dart';
import 'package:flutter_developers_guide/domain/usecases/get_posts_use_case.dart';
import 'package:flutter_developers_guide/ui/blocs/posts/post_bloc.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator({
  required Database database,
  required AppConfig config,
}) async {
  /* 




  Dependencies




  */
  locator.registerSingleton<Database>(database);

  locator.registerSingleton<AppConfig>(
    config,
  );

  locator.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );

  locator.registerLazySingleton<Logger>(() {
    final config = locator<AppConfig>();

    final logger = Logger(
      config.environment.name,
    );

    return logger;
  });

  locator.registerLazySingleton<Dio>(
    () {
      final dio = Dio(
        BaseOptions(
          baseUrl: config.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
        ),
      );

      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      );

      return dio;
    },
  );

  /* 




  Data sources




  */
  if (config.useFakeData) {
    locator.registerLazySingleton<AppDatabase>(
      () => FakeAppDatabase(),
    );
  } else {
    locator.registerLazySingleton<AppDatabase>(
      () => AppDatabaseImpl(
        postDAO: PostDAO(
          database: locator<Database>(),
        ),
      ),
    );
  }

  if (config.useFakeData) {
    locator.registerLazySingleton<ApiService>(
      () => FakeApiService(),
    );
  } else {
    locator.registerLazySingleton<ApiService>(
      () => ApiServiceImpl(
        dio: locator<Dio>(),
        config: locator<AppConfig>(),
        logger: locator<Logger>(),
        firebaseAuth: locator<FirebaseAuth>(),
      ),
    );
  }

  /* 




  Repositories




  */

  locator.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(
      localDataSource: locator<AppDatabase>(),
      remoteDataSource: locator<ApiService>(),
      logger: locator<Logger>(),
    ),
  );

  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: locator<ApiService>(),
      logger: locator<Logger>(),
    ),
  );

  /* 




  Use cases




  */
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

  /* 




  Blocs




  */

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
}
