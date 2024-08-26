import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';

import '../../../../../components/main_appbar.dart';
import '../../../../../components/list.dart';
import '../../../../../../core/router/routes.dart';

class ColorsBackgroundsView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
      title: 'Text Color',
      description: 'Text color',
      route: RoutePaths.colors,
    ),
    ListViewItem(
      title: 'Background',
      description: 'Background color',
      route: RoutePaths.backgrounds,
    ),
  ];

  final String _appBarTitle = 'Colors and backgrounds';

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
