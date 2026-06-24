import 'package:flutter_developers_guide/core/analytics/analytics_service.dart';
import 'package:flutter_developers_guide/core/locator/locator.dart';
import 'package:flutter_developers_guide/data/local/app_database.dart';
import 'package:flutter_developers_guide/data/remote/api_service.dart';
import 'package:flutter_developers_guide/data/repository_impl/auth_repository_impl.dart';
import 'package:flutter_developers_guide/data/repository_impl/image_repository_impl.dart';
import 'package:flutter_developers_guide/data/repository_impl/post_repository_impl.dart';
import 'package:flutter_developers_guide/data/repository_impl/todo_repository_impl.dart';
import 'package:flutter_developers_guide/domain/repository/auth_repository.dart';
import 'package:flutter_developers_guide/domain/repository/image_repository.dart';
import 'package:flutter_developers_guide/domain/repository/post_repository.dart';
import 'package:flutter_developers_guide/domain/repository/todo_repository.dart';
import 'package:logging/logging.dart';

void registerRepositories() {
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
      analytics: locator<AnalyticsService>(),
    ),
  );

  locator.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(
      remoteDataSource: locator<ApiService>(),
      logger: locator<Logger>(),
      analytics: locator<AnalyticsService>(),
    ),
  );

  locator.registerLazySingleton<ImageRepository>(
    () => ImageRepositoryImpl(
      remoteDataSource: locator<ApiService>(),
      logger: locator<Logger>(),
      analytics: locator<AnalyticsService>(),
    ),
  );
}
