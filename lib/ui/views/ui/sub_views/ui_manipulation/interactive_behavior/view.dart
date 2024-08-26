import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';

import '../../../../../components/main_appbar.dart';
import '../../../../../components/list.dart';
import '../../../../../../core/router/routes.dart';

class InteractiveBehaviorView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
      title: 'Click/tap behavior',
      description: 'When a user clicks an element.',
      route: RoutePaths.clickBehavior,
    ),
    ListViewItem(
      title: 'Hover behavior',
      description:
          'When a user hover over an element (on desktop class devices).',
      route: RoutePaths.hoverBehavior,
    ),
    ListViewItem(
      title: 'Focus behavior',
      description:
          'When a user interacts with an element or to make user focus on particular element (mostly an input field or button).',
      route: RoutePaths.focusBehavior,
    ),
  ];

  final String _appBarTitle = 'Interactive behaviors';

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
