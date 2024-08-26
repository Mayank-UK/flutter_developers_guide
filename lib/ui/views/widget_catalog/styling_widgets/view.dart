import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';

import '../../../components/main_appbar.dart';

import '../../../../core/router/routes.dart';
import '../../../components/list.dart';

class StylingWidgetsView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
      title: 'Padding',
      description: 'A widget that insets its child by the given padding.',
      route: RoutePaths.padding,
    ),
  ];

  final String _appBarTitle = 'Styling widgets';

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
