import 'package:flutter/material.dart';

import '../../components/main_appbar_component.dart';
import './../../components/custom_mid_stage_listview_component.dart';
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
      appBar: MainAppBarComponent(appBarTitle: this._appBarTitle),
      body: CustomMidStageListViewComponent(
        itemList: _itemList,
      ),
    );
  }
}
