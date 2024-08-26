import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/list.dart';

import '../../components/main_appbar.dart';
import '../../../core/router/routes.dart';

class LifecycleView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
      title: 'Application lifecycle',
      description: 'Doing stuff at various stages of an application lifecycle.',
      route: RoutePaths.applicationLifecycle,
    ),
    ListViewItem(
      title: 'Widget lifecycle',
      description: 'Doing stuff at various stages of a widget lifecycle.',
      route: RoutePaths.widgetLifecycle,
    ),
  ];

  final String _appBarTitle = 'Lifecycle';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: Links(
        itemList: this._itemList,
      ),
    );
  }
}
