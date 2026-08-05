import 'package:flutter/material.dart';

/// Single source of truth for the app's [ThemeMode].
///
/// Implemented as a [ValueNotifier] so the root [MaterialApp] can react via
/// [ValueListenableBuilder] — the lightest mechanism that fits the app's mixed
/// state-management setup (get_it + provider + riverpod + bloc) without pulling
/// any of those into a cross-cutting concern. The choice is kept in-memory only
/// because `shared_preferences` is not a dependency; adding it later is a
/// drop-in inside [toggle]/[set] (persist on change, restore in [instance]'s
/// initializer).
class ThemeModeController extends ValueNotifier<ThemeMode> {
  ThemeModeController._() : super(ThemeMode.system);

  /// Process-wide singleton — the root widget, drawer, and AppBar toggle all
  /// bind to the same instance.
  static final ThemeModeController instance = ThemeModeController._();

  /// Flips between light and dark. When the current value is [ThemeMode.system]
  /// the effective mode resolves to whatever the platform reports, so we treat
  /// "system currently resolving to dark" the same as explicit dark and jump to
  /// light — giving the icon a predictable single-tap behaviour everywhere.
  void toggle(BuildContext context) {
    final isDark = value == ThemeMode.dark ||
        (value == ThemeMode.system &&
            MediaQuery.platformBrightnessOf(context) == Brightness.dark);
    value = isDark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  /// Explicit setter used by the drawer's tri-state options (system/light/dark).
  void set(ThemeMode mode) {
    if (mode == value) return;
    value = mode;
    notifyListeners();
  }
}
