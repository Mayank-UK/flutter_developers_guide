import 'package:flutter_developers_guide/core/scenario/api_scenario.dart';
import 'package:flutter_developers_guide/core/scenario/db_scenario.dart';

enum Environment { dev, staging, prod }

class AppConfig {
  final Environment environment;
  final String baseUrl;
  final bool useFakeApi;
  final bool useFakeDatabase;
  final bool enableLogs;
  final ApiScenario apiScenario;
  final DbScenario dbScenario;

  const AppConfig({
    required this.environment,
    required this.baseUrl,
    required this.useFakeApi,
    required this.useFakeDatabase,
    required this.enableLogs,
    // both scenarios work only in dev mode and with fake data enabled
    this.apiScenario = ApiScenario.success,
    this.dbScenario = DbScenario.success,
  });

  bool get isDev => environment == Environment.dev;
  bool get isStaging => environment == Environment.staging;
  bool get isProd => environment == Environment.prod;
}
