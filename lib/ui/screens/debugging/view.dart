import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../navigation/routes.dart';
import '../../components/links.dart';

class DebuggingView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'DevTools',
      description:
          'A suite of performance and profiling tools that run in a browser.',
      route: RoutePaths.pageNotFound,
    ),
    Link(
      title: 'Code editor (enabled with the Flutter and Dart plugins)',
      description:
          'Support a built-in source-level debugger with the ability to set breakpoints, step through code, and examine values.',
      route: RoutePaths.pageNotFound,
    ),
    Link(
      title: 'Flutter inspector',
      description:
          'The inspector allows you to examine a visual representation of the widget tree, inspect individual widgets and their property values, enable the performance overlay, and more.',
      route: RoutePaths.pageNotFound,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Debugging",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
