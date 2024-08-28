import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../components/links.dart';
import '../../../../navigation/routes.dart';

class ResponsiveAdaptiveLayoutView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'Responsive layout',
      description: 'Layout gets adjusted according to the user\'s screen size.',
      route: RoutePaths.responsiveUi,
    ),
    Link(
      title: 'Adaptive layout',
      description:
          'Layout adapts according to the user\'s operating system like android or ios.',
      route: RoutePaths.adaptiveUi,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Responsive and adaptive layout",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
