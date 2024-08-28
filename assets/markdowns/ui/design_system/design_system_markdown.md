## colors.dart    
    class AppColors {
        // Light Theme Colors
        static const Color primaryLight = Color(0xFF6200EA);
        static const Color primaryVariantLight = Color(0xFF3700B3);
        static const Color secondaryLight = Color(0xFF03DAC6);
        static const Color secondaryVariantLight = Color(0xFF018786);
        static const Color surfaceLight = Color(0xFFFFFFFF);
        static const Color surfaceTintLight = Color(0xFFedf0ee);
        static const Color errorLight = Color(0xFFB00020);
        static const Color onPrimaryLight = Color(0xFFFFFFFF);
        static const Color onSecondaryLight = Color(0xFF000000);
        static const Color onBackgroundLight = Color(0xFF000000);
        static const Color onSurfaceLight = Color(0xFF000000);
        static const Color onErrorLight = Color(0xFFFFFFFF);

        // Dark Theme Colors
        static const Color primaryDark = Color(0xFFBB86FC);
        static const Color primaryVariantDark = Color(0xFF3700B3);
        static const Color secondaryDark = Color(0xFF03DAC6);
        static const Color secondaryVariantDark = Color(0xFF03DAC6);
        static const Color surfaceDark = Color(0xFF121212);
        static const Color surfaceTintDark = Color(0xFF616362);
        static const Color errorDark = Color(0xFFCF6679);
        static const Color onPrimaryDark = Color(0xFF000000);
        static const Color onSecondaryDark = Color(0xFF000000);
        static const Color onBackgroundDark = Color(0xFFFFFFFF);
        static const Color onSurfaceDark = Color(0xFFFFFFFF);
        static const Color onErrorDark = Color(0xFF000000);
    }


## typography.dart
    class AppTypography {
        static const String _montserrat = 'Montserrat';
        static const String _roboto = 'Roboto';

        static const TextStyle headline1 = TextStyle(
            fontFamily: _montserrat,
            fontSize: 96,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5,
        );

        static const TextStyle headline2 = TextStyle(
            fontFamily: _montserrat,
            fontSize: 60,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5,
        );

        static const TextStyle headline3 = TextStyle(
            fontFamily: _montserrat,
            fontSize: 48,
            fontWeight: FontWeight.w400,
        );

        static const TextStyle headline4 = TextStyle(
            fontFamily: _montserrat,
            fontSize: 34,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
        );

        static const TextStyle headline5 = TextStyle(
            fontFamily: _montserrat,
            fontSize: 24,
            fontWeight: FontWeight.w400,
        );

        static const TextStyle headline6 = TextStyle(
            fontFamily: _montserrat,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
        );

        static const TextStyle subtitle1 = TextStyle(
            fontFamily: _montserrat,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
        );

        static const TextStyle subtitle2 = TextStyle(
            fontFamily: _montserrat,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
        );

        static const TextStyle body1 = TextStyle(
            fontFamily: _roboto,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
        );

        static const TextStyle body2 = TextStyle(
            fontFamily: _roboto,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
        );

        static const TextStyle button = TextStyle(
            fontFamily: _montserrat,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.25,
        );

        static const TextStyle caption = TextStyle(
            fontFamily: _roboto,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
        );

        static const TextStyle overline = TextStyle(
            fontFamily: _roboto,
            fontSize: 10,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
        );
    }


## sizes.dart
    class DSSizes {
        static const double xxs = 2;
        static const double xs = 4;
        static const double sm = 8;
        static const double md = 16;
        static const double lg = 32;
        static const double xl = 64;
        static const double xxl = 128;
    }


## shadow.dart

    class DSShadows {
        static const buttonCard = const BoxShadow(
            color: Colors.black26,
            blurRadius: 2,
            offset: Offset(0, 2),
        );

        static const buttonCardHover = const BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 4),
        );

        static const drawer = const BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 8),
        );

        static const modal = const BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 8),
        );
    }

## theme.dart
    final ThemeData lightTheme = ThemeData(
        colorScheme: ColorScheme.light(
            primary: AppColors.primaryLight,
            primaryContainer: AppColors.primaryVariantLight,
            secondary: AppColors.secondaryLight,
            secondaryContainer: AppColors.secondaryVariantLight,
            surface: AppColors.surfaceLight,
            surfaceTint: AppColors.surfaceTintLight,
            error: AppColors.errorLight,
            onPrimary: AppColors.onPrimaryLight,
            onSecondary: AppColors.onSecondaryLight,
            onSurface: AppColors.onSurfaceLight,
            onError: AppColors.onErrorLight,
        ),
        textTheme: TextTheme(
            displayLarge: TextStyle(
            fontSize: 96,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5,
            ),
            displayMedium: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5,
            ),
            displaySmall: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w400,
            ),
            headlineMedium: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
            ),
            headlineSmall: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            ),
            titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
            ),
            titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
            ),
            titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
            ),
            bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
            ),
            bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
            ),
            labelLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.25,
            ),
            bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
            ),
            labelSmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
            ),
        ),
        );

    final ThemeData darkTheme = ThemeData(
        colorScheme: ColorScheme.dark(
            primary: AppColors.primaryDark,
            primaryContainer: AppColors.primaryVariantDark,
            secondary: AppColors.secondaryDark,
            secondaryContainer: AppColors.secondaryVariantDark,
            surface: AppColors.surfaceDark,
            surfaceTint: AppColors.surfaceTintDark,
            error: AppColors.errorDark,
            onPrimary: AppColors.onPrimaryDark,
            onSecondary: AppColors.onSecondaryDark,
            onSurface: AppColors.onSurfaceDark,
            onError: AppColors.onErrorDark,
        ),
        textTheme: TextTheme(
            displayLarge: TextStyle(
            fontSize: 96,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5,
            ),
            displayMedium: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5,
            ),
            displaySmall: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w400,
            ),
            headlineMedium: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
            ),
            headlineSmall: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            ),
            titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
            ),
            titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
            ),
            titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
            ),
            bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
            ),
            bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
            ),
            labelLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.25,
            ),
            bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
            ),
            labelSmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
            ),
        ),
    );


## main.dart
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


## usage examples
    Text(
    'Loading Markdown Info...',
    style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
        ),
    );

    Ink(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
                DSShadows.buttonCard,
            ],
        ),
        child: Container()
    )
