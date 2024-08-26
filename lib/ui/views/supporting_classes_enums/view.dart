import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/list.dart';

import '../../components/main_appbar.dart';

import './../../../core/router/routes.dart';

class SupportingClassesEnumsView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
      title: 'Supporting classes',
      description:
          'Classes that are used within widgets to provide additional functionality like decoration, etc.',
      route: RoutePaths.supportingClasses,
    ),
    ListViewItem(
      title: 'Supporting enums',
      description:
          'Enums that holds a group of values for different things like alignment, axis, etc.',
      route: RoutePaths.supportingEnums,
    ),
  ];

  final String _appBarTitle = 'Supporting classes and enums';

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
