import 'package:flutter/material.dart';
import 'colors.dart';
import 'typography.dart';

/// Shared Material 3 text theme built once from [AppTypography] and reused by
/// both [lightTheme] and [darkTheme] so the role/weight/letter-spacing scale
/// stays in lock-step with the React design system.
TextTheme _buildTextTheme() {
  return TextTheme(
    displayLarge: AppTypography.headline1,
    displayMedium: AppTypography.headline2,
    displaySmall: AppTypography.headline3,
    headlineMedium: AppTypography.headline4,
    headlineSmall: AppTypography.headline5,
    titleLarge: AppTypography.headline6,
    titleMedium: AppTypography.subtitle1,
    titleSmall: AppTypography.subtitle2,
    bodyLarge: AppTypography.body1,
    bodyMedium: AppTypography.body2,
    labelLarge: AppTypography.button,
    bodySmall: AppTypography.caption,
    labelSmall: AppTypography.overline,
  );
}

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    primary: AppColors.primaryLight,
    primaryContainer: AppColors.primaryContainerLight,
    secondary: AppColors.secondaryLight,
    secondaryContainer: AppColors.secondaryContainerLight,
    surface: AppColors.surfaceLight,
    surfaceTint: AppColors.surfaceTintLight,
    surfaceContainerHighest: AppColors.surfaceVariantLight,
    error: AppColors.errorLight,
    outline: AppColors.outlineLight,
    onPrimary: AppColors.onPrimaryLight,
    onSecondary: AppColors.onSecondaryLight,
    onSurface: AppColors.onSurfaceLight,
    onSurfaceVariant: AppColors.onSurfaceVariantLight,
    onError: AppColors.onErrorLight,
  ),
  scaffoldBackgroundColor: AppColors.surfaceLight,
  dividerColor: AppColors.outlineLight,
  textTheme: _buildTextTheme(),
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    primary: AppColors.primaryDark,
    primaryContainer: AppColors.primaryContainerDark,
    secondary: AppColors.secondaryDark,
    secondaryContainer: AppColors.secondaryContainerDark,
    surface: AppColors.surfaceDark,
    surfaceTint: AppColors.surfaceTintDark,
    surfaceContainerHighest: AppColors.surfaceVariantDark,
    error: AppColors.errorDark,
    outline: AppColors.outlineDark,
    onPrimary: AppColors.onPrimaryDark,
    onSecondary: AppColors.onSecondaryDark,
    onSurface: AppColors.onSurfaceDark,
    onSurfaceVariant: AppColors.onSurfaceVariantDark,
    onError: AppColors.onErrorDark,
  ),
  scaffoldBackgroundColor: AppColors.surfaceDark,
  dividerColor: AppColors.outlineDark,
  textTheme: _buildTextTheme(),
);
