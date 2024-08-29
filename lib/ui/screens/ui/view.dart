import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/navigation/routes.dart';
import 'package:flutter_developers_guide/ui/components/links.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

class UIView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'UI manipulation',
      description:
          'All the important UI operations like tap, showing shadow, positioning, etc',
      route: RoutePaths.uiManipulation,
    ),
    Link(
      title: 'Design system',
      description:
          'Implementation of colors, types, spacing, etc, in a reusable and systematic way.',
      route: RoutePaths.designSystem,
    ),
    Link(
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
      mobileUi: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
