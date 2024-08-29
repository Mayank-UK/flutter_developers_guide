import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../navigation/routes.dart';
import '../../components/links.dart';

class StateManagementView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
        title: 'State management basics and stateful widgets',
        description: 'Managing state using stateful widgets.',
        route: RoutePaths.state_management_basics),
    Link(
        title: '"Provider" package for state management',
        description:
            'Basics of state management using provider (officially supported).',
        route: RoutePaths.providerStateManagement),
    Link(
        title: '"Bloc" package for state management',
        description: 'Basics of state management using bloc (widely used)',
        route: RoutePaths.blocStateManagement),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "State management",
      mobileUi: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
