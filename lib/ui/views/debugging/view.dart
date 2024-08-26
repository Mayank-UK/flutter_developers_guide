import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';

import '../../components/main_appbar.dart';
import '../../../core/router/routes.dart';
import '../../components/list.dart';

class DebuggingView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
      title: 'DevTools',
      description:
          'A suite of performance and profiling tools that run in a browser.',
      route: RoutePaths.pageNotFound,
    ),
    ListViewItem(
      title: 'Code editor (enabled with the Flutter and Dart plugins)',
      description:
          'Support a built-in source-level debugger with the ability to set breakpoints, step through code, and examine values.',
      route: RoutePaths.pageNotFound,
    ),
    ListViewItem(
      title: 'Flutter inspector',
      description:
          'The inspector allows you to examine a visual representation of the widget tree, inspect individual widgets and their property values, enable the performance overlay, and more.',
      route: RoutePaths.pageNotFound,
    ),
  ];

  final String _appBarTitle = 'Debugging';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: Links(
        itemList: _itemList,
      ),
    );
  }
}
