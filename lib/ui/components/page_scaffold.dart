import 'package:flutter/material.dart';

class PageScaffold extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final GlobalKey? scaffoldKey;

  const PageScaffold({
    Key? key,
    required this.title,
    required this.children,
    this.scaffoldKey,
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
        child: Column(
          children: [
            SizedBox(height: 16),
            ...children,
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
