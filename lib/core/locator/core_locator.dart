import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_developers_guide/core/analytics/analytics_service.dart';
import 'package:flutter_developers_guide/core/config/app_config.dart';
import 'package:logging/logging.dart';
import 'package:sqflite/sqlite_api.dart';

import 'locator.dart';

void registerCoreDependencies({
  required Database database,
  required AppConfig config,
}) {
  locator.registerSingleton<Database>(database);

  locator.registerSingleton<AppConfig>(
    config,
  );

  locator.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );

  locator.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  locator.registerLazySingleton<FirebaseStorage>(
    () => FirebaseStorage.instance,
  );

  locator.registerLazySingleton<FirebaseAnalytics>(
    () => FirebaseAnalytics.instance,
  );

  locator.registerLazySingleton<AnalyticsService>(
    () => AnalyticsService(
      locator<FirebaseAnalytics>(),
    ),
  );

  locator.registerLazySingleton<FirebaseAnalyticsObserver>(
    () => FirebaseAnalyticsObserver(
      analytics: locator<FirebaseAnalytics>(),
    ),
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
}
