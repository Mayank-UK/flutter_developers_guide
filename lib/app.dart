import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/config/app_config.dart';
import 'package:flutter_developers_guide/core/config/logger_config.dart';
import 'package:flutter_developers_guide/core/di/injection.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/core/provider_setup.dart';
import 'package:flutter_developers_guide/data/local/app_database.dart';
import 'package:flutter_developers_guide/domain/repository/auth_repository.dart';
import 'package:flutter_developers_guide/firebase_options.dart';
import 'package:flutter_developers_guide/ui/design_system/theme.dart';
import 'package:flutter_developers_guide/ui/navigation/router.dart';
import 'package:flutter_developers_guide/ui/services/theme_mode_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;

class MyAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MultiProvider for all the providers
    return MultiProvider(
      providers: providers,
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: ThemeModeController.instance,
        builder: (context, mode, _) {
          return MaterialApp.router(
            title: 'Flutter Developer\'s Guide',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: mode,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}

Future<void> bootstrapApp({
  required AppConfig config,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  tz.initializeTimeZones();

  configureLogging(config);

  final logger = Logger('Bootstrap');

  logger.info(
    'Environment: ${config.environment.name}',
  );

  logger.info(
    'Using fake API: ${config.useFakeApi} | fake DB: ${config.useFakeDatabase}',
  );

  logger.info(
    'Logs enabled: ${config.enableLogs}',
  );

  final db = await DatabaseProvider.database;

  await initializeDependencies(
    database: db,
    config: config,
  );

  // Ensure an authenticated Firebase session before any Firestore/Storage demo
  // reads data. Firebase's 30-day test-mode rules have expired, so anonymous
  // auth is required to satisfy auth-required security rules. This is non-fatal
  // — if it fails (e.g. anonymous provider disabled in the Firebase console),
  // the demo repositories surface permission errors through normal Failure
  // plumbing and the app still runs.
  try {
    final authRepository = getIt<AuthRepository>();
    final result = await authRepository.ensureAnonymousSession();
    if (result case Failed(failure: final failure)) {
      logger.warning(
        'Anonymous session unavailable; Firebase demos may be limited: '
        '${failure.message}',
      );
    }
  } catch (e, st) {
    logger.warning('Anonymous session failed', e, st);
  }

  runApp(
    // ProviderScope for riverpod
    ProviderScope(
      child: MyAPP(),
    ),
  );
}
