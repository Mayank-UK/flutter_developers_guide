import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';

import '../../../../../components/main_appbar.dart';
import '../../../../../components/list.dart';
import '../../../../../../core/router/routes.dart';

class EffectsView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
      title: 'Shadows',
      description: 'Shadows of widgets.',
      route: RoutePaths.shadows,
    ),
    ListViewItem(
        title: 'Opacity',
        description: 'Opacity of widgets.',
        route: RoutePaths.opacityEffect),
  ];

  final String _appBarTitle = 'Effects';

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
