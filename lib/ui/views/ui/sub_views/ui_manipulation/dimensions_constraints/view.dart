import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';

import '../../../../../components/main_appbar.dart';
import '../../../../../components/list.dart';
import '../../../../../../core/router/routes.dart';

class DimenionsContraintsView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
      title: 'Fixed dimensions',
      description: 'Dimensions in fixed values.',
      route: RoutePaths.fixedDimensions,
    ),
    ListViewItem(
        title: 'Percentage dimensions',
        description: 'Dimensions in percentage to the parent.',
        route: RoutePaths.percentageDimensions),
    ListViewItem(
      title: 'Fractional full screen dimensions',
      description: 'Dimensions in fraction to the whole screen.',
      route: RoutePaths.fractionalDimensions,
    ),
    ListViewItem(
        title: 'Constraints',
        description: 'Dimensions in max/min.',
        route: RoutePaths.constraints),
  ];

  final String _appBarTitle = 'Dimensions and constraints';

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
