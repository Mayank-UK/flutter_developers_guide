import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/models/list_item.dart';
import 'package:flutter_developers_guide/ui/navigation/routes.dart';
import 'package:flutter_developers_guide/ui/components/links.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

class UIView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
      title: 'UI manipulation',
      description:
          'All the important UI operations like tap, showing shadow, positioning, etc',
      route: RoutePaths.uiManipulation,
    ),
    LinkItem(
      title: 'Design system',
      description:
          'Implementation of colors, types, spacing, etc, in a reusable and systematic way.',
      route: RoutePaths.designSystem,
    ),
    LinkItem(
      title: 'Responsive & adaptive UI',
      description:
          'Responsive and adaptive design for every screen sizes and based on OS.',
      route: RoutePaths.responsiveAdaptiveUi,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "UI",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
