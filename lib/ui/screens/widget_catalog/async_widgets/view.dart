import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../navigation/routes.dart';
import '../../../components/links.dart';

class AsyncWidgetsView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
        title: 'FutureBuilder',
        description:
            'Widget that builds itself based on the latest snapshot of interaction with a Future.',
        route: RoutePaths.futureBuilder),
    Link(
      title: 'StreamBuilder',
      description:
          'Widget that builds itself based on the latest snapshot of interaction with a Stream.',
      route: RoutePaths.streamBuilder,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Async",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
