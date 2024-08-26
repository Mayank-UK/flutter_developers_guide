import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';
import 'package:flutter_developers_guide/core/router/routes.dart';
import 'package:flutter_developers_guide/ui/components/list.dart';
import 'package:flutter_developers_guide/ui/components/main_appbar.dart';

class UIView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
      title: 'UI manipulation',
      description:
          'All the important UI operations like tap, showing shadow, positioning, etc',
      route: RoutePaths.uiManipulation,
    ),
    ListViewItem(
      title: 'Design system',
      description:
          'Implementation of colors, types, spacing, etc, in a reusable and systematic way.',
      route: RoutePaths.designSystem,
    ),
    ListViewItem(
      title: 'Responsive & adaptive UI',
      description:
          'Responsive and adaptive design for every screen sizes and based on OS.',
      route: RoutePaths.responsiveAdaptiveUi,
    ),
  ];

  final String _appBarTitle = 'UI';

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
