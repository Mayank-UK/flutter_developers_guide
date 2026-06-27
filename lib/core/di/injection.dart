import 'package:flutter_developers_guide/core/config/app_config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqlite_api.dart';

import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> initializeDependencies({
  required Database database,
  required AppConfig config,
}) async {
  getIt.registerSingleton(config);
  getIt.registerSingleton(database);

  getIt.init();
}
