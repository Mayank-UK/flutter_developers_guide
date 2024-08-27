import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/design_system/design_system.dart';

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
      appBar: AppBar(
        backgroundColor: DSColors.SecondaryDark,
        foregroundColor: Colors.white,
        title: Text(
          title,
          style: DSTypography.h6Light,
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
