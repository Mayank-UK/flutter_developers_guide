import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';

import '../../../../../components/main_appbar.dart';
import '../../../../../components/list.dart';
import '../../../../../../core/router/routes.dart';

class SpacingView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
        title: 'Padding',
        description: 'Spacing between parent and it\'s children.',
        route: RoutePaths.paddingSpacing),
    ListViewItem(
      title: 'Margin',
      description: 'Spacing from the surrounding elements.',
      route: RoutePaths.marginSpacing,
    ),
  ];

  final String _appBarTitle = 'spacing';

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
