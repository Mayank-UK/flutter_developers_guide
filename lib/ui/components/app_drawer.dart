import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/app_shell.dart';
import 'package:flutter_developers_guide/ui/navigation/routes.dart';
import 'package:flutter_developers_guide/ui/navigation/top_level_destinations.dart';
import 'package:flutter_developers_guide/ui/services/theme_mode_controller.dart';
import 'package:go_router/go_router.dart';

/// Shared navigation drawer rendered by [AppShell].
///
/// Mirrors the React sister-app's root layout: a header, the top-level
/// destination list, a tri-state theme selector, and an About entry. Closes
/// itself after a destination is tapped so the user lands on a clean screen.
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _go(BuildContext context, String route) {
    Navigator.of(context).pop(); // close the drawer
    if (GoRouterState.of(context).matchedLocation != route) {
      context.go(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    final current = GoRouterState.of(context).matchedLocation;
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Flutter developer's guide",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(Icons.home_outlined),
                    title: const Text('Home'),
                    selected: current == RoutePaths.home,
                    onTap: () => _go(context, RoutePaths.home),
                  ),
                  const Divider(),
                  ...topLevelDestinations.map(
                    (d) => ListTile(
                      leading: const Icon(Icons.chevron_right),
                      title: Text(d.title),
                      selected: current == d.route,
                      onTap: () => _go(context, d.route),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: const Text('About'),
                    selected: current == RoutePaths.about,
                    onTap: () => _go(context, RoutePaths.about),
                  ),
                ],
              ),
            ),
            const Divider(),
            const _ThemeModeSelector(),
          ],
        ),
      ),
    );
  }
}

/// Tri-state (system / light / dark) selector bound to [ThemeModeController].
class _ThemeModeSelector extends StatelessWidget {
  const _ThemeModeSelector();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeModeController.instance,
      builder: (context, mode, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Text(
                  'Theme',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              Wrap(
                spacing: 8,
                children: [
                  _chip(context, mode, ThemeMode.system, 'System', Icons.brightness_auto),
                  _chip(context, mode, ThemeMode.light, 'Light', Icons.light_mode_outlined),
                  _chip(context, mode, ThemeMode.dark, 'Dark', Icons.dark_mode_outlined),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _chip(
    BuildContext context,
    ThemeMode current,
    ThemeMode option,
    String label,
    IconData icon,
  ) {
    final selected = current == option;
    return ChoiceChip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
      selected: selected,
      onSelected: (_) {
        ThemeModeController.instance.set(option);
        // The drawer stays open so the user can see the theme apply; the shell
        // rebuilds the whole tree above via ValueListenableBuilder at the root.
      },
      selectedColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }
}

// The drawer is opened from the per-screen AppBar via [AppShell.appShellScaffoldKey];
// see [PageScaffold]'s leading hamburger icon.
