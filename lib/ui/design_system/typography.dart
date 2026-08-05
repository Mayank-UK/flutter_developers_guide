import 'package:flutter/material.dart';

class AppTypography {
  static const String _montserrat = 'Montserrat';
  static const String _inter = 'Inter';

  /// Monospace family used by code-rendering components (e.g. `CodeBlock`).
  static const String mono = 'JetBrains Mono';

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
    fontFamily: _inter,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: _inter,
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
    fontFamily: _inter,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  );

  static const TextStyle overline = TextStyle(
    fontFamily: _inter,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  );
}
