import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/app_shell.dart';
import 'package:flutter_developers_guide/ui/components/responsive_layout.dart';
import 'package:flutter_developers_guide/ui/services/theme_mode_controller.dart';

class PageScaffold extends StatelessWidget {
  final List<Widget> mobileUi;
  final List<Widget>? tabletUi;
  final List<Widget>? desktopUi;
  final String title;
  final GlobalKey? scaffoldKey;

  const PageScaffold({
    Key? key,
    required this.title,
    this.scaffoldKey,
    required this.mobileUi,
    this.tabletUi,
    this.desktopUi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        leading: IconButton(
          tooltip: 'Open navigation menu',
          icon: const Icon(Icons.menu),
          // The drawer lives on the [AppShell] Scaffold that wraps every route
          // via the top-level ShellRoute; open it via the shell's key so the
          // per-screen AppBar stays the single visual AppBar (no double-appbar).
          onPressed: () =>
              AppShell.appShellScaffoldKey.currentState?.openDrawer(),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        actions: const [
          _ThemeToggleButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: ResponsiveLayout(
          mobileLayout: Column(children: mobileUi),
          tabletLayout: Column(children: tabletUi ?? mobileUi),
          desktopLayout: Column(children: desktopUi ?? mobileUi),
        ),
      ),
    );
  }
}

/// Light/dark AppBar action bound to [ThemeModeController]. Tapping flips
/// between light and dark; the drawer owns the full tri-state selector.
class _ThemeToggleButton extends StatelessWidget {
  const _ThemeToggleButton();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeModeController.instance,
      builder: (context, mode, _) {
        final isDark = mode == ThemeMode.dark ||
            (mode == ThemeMode.system &&
                MediaQuery.platformBrightnessOf(context) == Brightness.dark);
        return IconButton(
          tooltip: isDark ? 'Switch to light theme' : 'Switch to dark theme',
          icon: Icon(isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
          onPressed: () => ThemeModeController.instance.toggle(context),
        );
      },
    );
  }
}
