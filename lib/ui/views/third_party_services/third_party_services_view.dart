import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/list.dart';

import '../../components/main_appbar.dart';

import './../../../core/router/routes.dart';

class ThirdPartyServicesView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
      title: 'Firebase',
      description: 'Using firebase services',
      route: RoutePaths.firebase,
    ),
  ];

  final String _appBarTitle = 'Firebase';

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
