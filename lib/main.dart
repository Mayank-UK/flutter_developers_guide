// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/locator.dart';
import 'package:flutter_developers_guide/data/local/app_database.dart';
import 'package:flutter_developers_guide/ui/design_system/theme.dart';
import 'package:provider/provider.dart';
import 'core/provider_setup.dart';
import 'ui/navigation/routes.dart';
import 'ui/navigation/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  setupLocator(await DatabaseProvider.database);

  runApp(MyAPP());
}

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
