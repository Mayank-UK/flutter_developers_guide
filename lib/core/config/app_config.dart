enum Environment { dev, staging, prod }

class AppConfig {
  final Environment environment;
  final String baseUrl;
  final bool useFakeApi;
  final bool useFakeDatabase;
  final bool enableLogs;

  const AppConfig({
    required this.environment,
    required this.baseUrl,
    required this.useFakeApi,
    required this.useFakeDatabase,
    required this.enableLogs,
  });

  bool get isDev => environment == Environment.dev;
  bool get isStaging => environment == Environment.staging;
  bool get isProd => environment == Environment.prod;
}
