import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/navigation/routes.dart';
import 'package:flutter_developers_guide/ui/components/links.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

class OtherBasicsView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'Native bridging',
      description:
          'Integrate functionality between native platform and flutter.',
      route: RoutePaths.nativeBridging,
    ),
    Link(
      title: 'Background tasks',
      description: 'Run tasks in background.',
      route: RoutePaths.backgroundTask,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Other basics",
      mobileUi: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
