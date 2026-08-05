import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_developers_guide/core/analytics/analytics_service.dart';
import 'package:flutter_developers_guide/core/config/app_config.dart';
import 'package:flutter_developers_guide/core/connectivity/connectivity_service.dart';
import 'package:flutter_developers_guide/data/local/app_database.dart';
import 'package:flutter_developers_guide/data/local/daos/post_dao.dart';
import 'package:flutter_developers_guide/data/local/fake_app_database.dart';
import 'package:flutter_developers_guide/data/remote/auth_remote_data_source.dart';
import 'package:flutter_developers_guide/data/remote/fake_auth_remote_data_source.dart';
import 'package:flutter_developers_guide/data/remote/fake_image_remote_data_source.dart';
import 'package:flutter_developers_guide/data/remote/fake_post_remote_data_source.dart';
import 'package:flutter_developers_guide/data/remote/fake_todo_remote_data_source.dart';
import 'package:flutter_developers_guide/data/remote/interceptors/auth_token_interceptor.dart';
import 'package:flutter_developers_guide/data/remote/interceptors/failure_injection_interceptor.dart';
import 'package:flutter_developers_guide/data/remote/image_remote_data_source.dart';
import 'package:flutter_developers_guide/data/remote/post_remote_data_source.dart';
import 'package:flutter_developers_guide/data/remote/interceptors/retry_interceptor.dart';
import 'package:flutter_developers_guide/data/remote/todo_remote_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:sqflite/sqlite_api.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @lazySingleton
  FirebaseStorage get storage => FirebaseStorage.instance;

  @lazySingleton
  FirebaseAnalytics get analytics => FirebaseAnalytics.instance;

  @lazySingleton
  AnalyticsService analyticsService(
    FirebaseAnalytics analytics,
  ) {
    return AnalyticsService(analytics);
  }

  @lazySingleton
  FirebaseAnalyticsObserver analyticsObserver(
    FirebaseAnalytics analytics,
  ) {
    return FirebaseAnalyticsObserver(
      analytics: analytics,
    );
  }

  @lazySingleton
  Logger logger(
    AppConfig config,
  ) {
    return Logger(
      config.environment.name,
    );
  }

  @lazySingleton
  FailureInjectionInterceptor failureInjectionInterceptor(
    AppConfig config,
  ) =>
      FailureInjectionInterceptor(scenario: config.apiScenario);

  @lazySingleton
  Dio dio(
    AppConfig config,
    FirebaseAuth firebaseAuth,
    FailureInjectionInterceptor failureInjectionInterceptor,
  ) {
    // Retry runs first on errors; auth headers are attached to every request.
    final retryInterceptor = RetryInterceptor();
    final authTokenInterceptor = AuthTokenInterceptor(firebaseAuth: firebaseAuth);

    final dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(authTokenInterceptor);
    dio.interceptors.add(retryInterceptor);

    if (config.isDev) {
      // Dev: simulate failures against the real client + log traffic.
      dio.interceptors.add(failureInjectionInterceptor);
    }

    if (config.enableLogs) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      );
    }

    // Let retries re-enqueue through the full chain now that Dio is built.
    retryInterceptor.attach(dio);

    return dio;
  }

  @lazySingleton
  ConnectivityService connectivityService() => ConnectivityService();

  @lazySingleton
  AppDatabase appDatabase(
    AppConfig config,
    Database database,
    Logger logger,
  ) {
    if (config.useFakeDatabase) {
      return FakeAppDatabase(scenario: config.dbScenario);
    }

    return AppDatabaseImpl(
      postDAO: PostDAO(database: database, logger: logger),
    );
  }

  @lazySingleton
  AuthRemoteDataSource authRemoteDataSource(
    AppConfig config,
    Logger logger,
    FirebaseAuth auth,
  ) {
    if (config.useFakeApi) {
      return FakeAuthRemoteDataSource(scenario: config.apiScenario);
    }

    return FirebaseAuthRemoteDataSource(
      firebaseAuth: auth,
      logger: logger,
    );
  }

  @lazySingleton
  PostRemoteDataSource postRemoteDataSource(
    AppConfig config,
    Dio dio,
  ) {
    if (config.useFakeApi) {
      return FakePostRemoteDataSource(scenario: config.apiScenario);
    }

    // Real Dio client + interceptor chain. In dev, the
    // FailureInjectionInterceptor simulates failures against the live API.
    return JsonPlaceholderPostRemoteDataSource(
      dio: dio,
    );
  }

  @lazySingleton
  TodoRemoteDataSource todoRemoteDataSource(
    AppConfig config,
    FirebaseFirestore firestore,
  ) {
    if (config.useFakeApi) {
      return FakeTodoRemoteDataSource(scenario: config.apiScenario);
    }

    return FirestoreTodoRemoteDataSource(
      firebaseFirestore: firestore,
    );
  }

  @lazySingleton
  ImageRemoteDataSource imageRemoteDataSource(
    AppConfig config,
    FirebaseFirestore firestore,
    FirebaseStorage storage,
  ) {
    if (config.useFakeApi) {
      return FakeImageRemoteDataSource(scenario: config.apiScenario);
    }

    return FirebaseStorageImageRemoteDataSource(
      firebaseFirestore: firestore,
      firebaseStorage: storage,
    );
  }
}
