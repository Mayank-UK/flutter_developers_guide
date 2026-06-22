import 'package:flutter_developers_guide/app.dart';
import 'package:flutter_developers_guide/core/config/app_config.dart';

void main() {
  bootstrapApp(
    config: const AppConfig(
      environment: Environment.staging,
      baseUrl: 'https://jsonplaceholder.typicode.com',
      useFakeData: false,
      enableLogs: true,
    ),
  );
}
