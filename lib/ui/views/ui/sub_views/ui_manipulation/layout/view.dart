import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';

import '../../../../../components/main_appbar.dart';
import '../../../../../components/list.dart';
import '../../../../../../core/router/routes.dart';

class LayoutView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
      title: 'Basic layout widgets',
      description: 'Basic layout widgets like container, row, column etc',
      route: RoutePaths.basicLayout,
    ),
    ListViewItem(
      title: 'Application and page layout',
      description:
          'Structuring a the layout for whole application and individual pages.',
      route: RoutePaths.pageLayout,
    ),
  ];

  final String _appBarTitle = 'Layout';

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
