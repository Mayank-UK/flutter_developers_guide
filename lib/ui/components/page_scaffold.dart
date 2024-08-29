import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/responsive_layout.dart';

class PageScaffold extends StatelessWidget {
  // final List<Widget> children;
  List<Widget> mobileUi;
  List<Widget>? tabletUi;
  List<Widget>? desktopUi;
  final String title;
  final GlobalKey? scaffoldKey;

  PageScaffold({
    Key? key,
    required this.title,
    // required this.children,
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
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: ResponsiveLayout(
          mobileLayout: Column(children: mobileUi!),
          tabletLayout: Column(children: (tabletUi ?? mobileUi)!),
          desktopLayout: Column(children: (desktopUi ?? mobileUi)!),
        ),
      ),
    );
  }
}
