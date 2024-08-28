import 'package:flutter_developers_guide/data/local/app_database.dart';
import 'package:flutter_developers_guide/data/local/daos/post_dao.dart';
import 'package:flutter_developers_guide/data/remote/api_service.dart';
import 'package:flutter_developers_guide/data/repository_impl/post_repository_impl.dart';
import 'package:flutter_developers_guide/domain/repository/post_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

// this file uses get_it package, this package enables us to implement design patterns like singleton, factory, etc easily
GetIt locator = GetIt.instance;

void setupLocator(Database database) {
  locator.registerSingleton<Database>(database);

  locator.registerLazySingleton<AppDatabaseImpl>(
    () => AppDatabaseImpl(
      postDAO: PostDAO(database: database),
    ),
  );

  locator.registerLazySingleton<ApiService>(
      () => ApiServiceImpl(client: http.Client()));

  locator.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(
        localDataSource: locator<AppDatabaseImpl>(),
        remoteDataSource: locator<ApiService>(),
      ));
}
