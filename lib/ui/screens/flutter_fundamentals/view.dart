import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../components/links.dart';
import '../../navigation/routes.dart';

class FlutterFundamentalsView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
      title: 'Important concepts',
      description: 'About flutter and it\'s it main concepts.',
      route: RoutePaths.importantConceptsFlutter,
    ),
    LinkItem(
      title: 'Installation and setup',
      description:
          'Installing and setting up the flutter development environment.',
      route: RoutePaths.installationSetup,
    ),
    LinkItem(
      title: 'Using flutter',
      description: 'Setting up a flutter project and doing the development.',
      route: RoutePaths.usingFlutter,
    ),
    LinkItem(
      title: 'About widgets',
      description: 'General information and concepts about widgets.',
      route: RoutePaths.aboutWidgets,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Flutter fundamentals",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
