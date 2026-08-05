import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/app_drawer.dart';

/// Wraps every route via the top-level [ShellRoute] to provide shared chrome —
/// the navigation [Drawer] — while leaving each screen's [PageScaffold] in
/// charge of its own [AppBar] (avoids double-appbar conflicts).
///
/// The drawer is hosted on this Scaffold and opened from the per-screen
/// [PageScaffold]'s AppBar hamburger via [appShellScaffoldKey]. The shell
/// deliberately renders no AppBar of its own.
class AppShell extends StatelessWidget {
  /// Routes share this key so any descendant (e.g. [PageScaffold]'s leading
  /// hamburger) can open the shell's drawer.
  static final GlobalKey<ScaffoldState> appShellScaffoldKey =
      GlobalKey<ScaffoldState>();

  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appShellScaffoldKey,
      drawer: const AppDrawer(),
      body: child,
    );
  }
}
