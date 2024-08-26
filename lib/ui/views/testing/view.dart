import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/list.dart';

import '../../components/main_appbar.dart';

import './../../../core/router/routes.dart';

class TestingView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
      title: 'Unit testing',
      description: 'Testing individual unit in isolation.',
      route: RoutePaths.unitTesting,
    ),
    ListViewItem(
      title: 'Integration testing',
      description:
          'Testing the integrated functionality between two or more units.',
      route: RoutePaths.integrationTesting,
    ),
  ];

  final String _appBarTitle = 'Testing';

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
