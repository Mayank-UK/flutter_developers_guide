import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';

import '../../../../core/router/routes.dart';
import '../../../components/list.dart';
import '../../../components/main_appbar.dart';

class AsyncWidgetsView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
        title: 'FutureBuilder',
        description:
            'Widget that builds itself based on the latest snapshot of interaction with a Future.',
        route: RoutePaths.futureBuilder),
    ListViewItem(
      title: 'StreamBuilder',
      description:
          'Widget that builds itself based on the latest snapshot of interaction with a Stream.',
      route: RoutePaths.streamBuilder,
    ),
  ];

  final String _appBarTitle = 'Async';

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
