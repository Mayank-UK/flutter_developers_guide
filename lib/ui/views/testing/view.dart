import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/links.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import './../../../core/router/routes.dart';

class TestingView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
      title: 'Unit testing',
      description: 'Testing individual unit in isolation.',
      route: RoutePaths.unitTesting,
    ),
    LinkItem(
      title: 'Integration testing',
      description:
          'Testing the integrated functionality between two or more units.',
      route: RoutePaths.integrationTesting,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Testing",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
