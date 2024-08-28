import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../navigation/routes.dart';
import '../../components/links.dart';

class StateManagementView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
        title: 'State management basics and stateful widgets',
        description: 'Managing state using stateful widgets.',
        route: RoutePaths.state_management_basics),
    LinkItem(
        title: '"Provider" package for state management',
        description:
            'Basics of state management using provider (officially supported).',
        route: RoutePaths.providerStateManagement),
    LinkItem(
        title: 'Todos application example',
        description: 'Implementation of a simple todo application.',
        route: RoutePaths.state_management_todos_example),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "State management",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
