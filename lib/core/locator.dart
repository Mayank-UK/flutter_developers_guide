// this file uses get_it package, this package enables us to implement
// design patterns like singleton, factory, etc easily

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

void setupLocator(Database database) {
  // External dependencies
  locator.registerSingleton<Database>(database);

  locator.registerLazySingleton<Logger>(
    () => Logger('App'),
  );

  // Data sources
  locator.registerLazySingleton<AppDatabase>(
    () => AppDatabaseImpl(
      postDAO: PostDAO(
        database: locator<Database>(),
      ),
    ),
  );

  locator.registerLazySingleton<ApiService>(
    () => ApiServiceImpl(
      client: http.Client(),
    ),
  );

  // Repositories
  locator.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(
      localDataSource: locator<AppDatabase>(),
      remoteDataSource: locator<ApiService>(),
      logger: locator<Logger>(),
    ),
  );

  // Use cases
  locator.registerFactory<GetPostsUseCase>(
    () => GetPostsUseCase(
      locator<PostRepository>(),
    ),
  );

  // Blocs
  locator.registerFactory<PostsBloc>(
    () => PostsBloc(
      getPostsUseCase: locator<GetPostsUseCase>(),
    ),
  );
}
