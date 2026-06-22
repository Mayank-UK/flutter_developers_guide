import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/config/app_config.dart';
import 'package:flutter_developers_guide/core/config/logger_config.dart';
import 'package:flutter_developers_guide/core/locator.dart';
import 'package:flutter_developers_guide/core/provider_setup.dart';
import 'package:flutter_developers_guide/data/local/app_database.dart';
import 'package:flutter_developers_guide/ui/design_system/theme.dart';
import 'package:flutter_developers_guide/ui/navigation/router.dart';
import 'package:flutter_developers_guide/ui/navigation/routes.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;

class MyAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        initialRoute: RoutePaths.home,
        onGenerateRoute: MyRouter.generateRoute,
      ),
    );
  }
}

Future<void> bootstrapApp({
  required AppConfig config,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  tz.initializeTimeZones();

  configureLogging(config);

  final logger = Logger('Bootstrap');

  logger.info(
    'Environment: ${config.environment.name}',
  );

  logger.info(
    'Using fake API: ${config.useFakeData}',
  );

  logger.info(
    'Logs enabled: ${config.enableLogs}',
  );

  final db = await DatabaseProvider.database;

  await setupLocator(
    database: db,
    config: config,
  );

  runApp(MyAPP());
}
