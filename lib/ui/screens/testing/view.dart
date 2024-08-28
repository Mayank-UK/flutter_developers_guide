import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/links.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../navigation/routes.dart';

class TestingView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'Unit testing',
      description: 'Testing individual unit in isolation.',
      route: RoutePaths.unitTesting,
    ),
    Link(
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
