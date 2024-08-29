import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

class PageNotFoundView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Page not found",
      mobileUi: [
        const Text('Page not found screen'),
      ],
    );
  }
}
