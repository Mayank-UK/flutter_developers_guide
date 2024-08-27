// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './core/providers/provider_setup.dart';

import './core/router/routes.dart';
import './core/router/router.dart';

import './ui/design_system/design_system.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(MyAPP());
}

class MyAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter fundamentals',
        theme: ThemeData(
          // brightness: Brightness.dark,
          primaryColor: DSColors.Primary,
          hintColor: DSColors.Secondary,
          fontFamily: 'Montserrat',
        ),
        initialRoute: RoutePaths.home,
        onGenerateRoute: MyRouter.generateRoute,
      ),
    );
  }
}
