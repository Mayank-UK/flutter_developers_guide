import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_developers_guide/core/config/app_config.dart';
import 'package:flutter_developers_guide/core/locator/locator.dart';
import 'package:flutter_developers_guide/data/local/app_database.dart';
import 'package:flutter_developers_guide/data/local/daos/post_dao.dart';
import 'package:flutter_developers_guide/data/local/fake_app_database.dart';
import 'package:flutter_developers_guide/data/remote/api_service.dart';
import 'package:flutter_developers_guide/data/remote/api_service_impl.dart';
import 'package:flutter_developers_guide/data/remote/fake_api_service.dart';
import 'package:logging/logging.dart';
import 'package:sqflite/sqflite.dart';

void registerDataSources() {
  final config = locator<AppConfig>();

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
        firebaseFirestore: locator<FirebaseFirestore>(),
        firebaseStorage: locator<FirebaseStorage>(),
      ),
    );
  }
}
