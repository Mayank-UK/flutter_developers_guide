// this file uses get_it package, this package enables us to implement
// design patterns like singleton, factory, etc easily

import 'package:flutter_developers_guide/core/config/app_config.dart';
import 'package:flutter_developers_guide/core/locator/bloc_locator.dart';
import 'package:flutter_developers_guide/core/locator/core_locator.dart';
import 'package:flutter_developers_guide/core/locator/datasource_locator.dart';
import 'package:flutter_developers_guide/core/locator/repository_locator.dart';
import 'package:flutter_developers_guide/core/locator/usecase_locator.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqlite_api.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator({
  required Database database,
  required AppConfig config,
}) async {
  registerCoreDependencies(
    database: database,
    config: config,
  );

  registerDataSources();
  registerRepositories();
  registerUseCases();
  registerBlocs();
}
