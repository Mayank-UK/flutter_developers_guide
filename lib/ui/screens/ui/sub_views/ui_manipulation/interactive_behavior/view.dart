import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/links.dart';
import '../../../../../navigation/routes.dart';

class InteractiveBehaviorView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'Click/tap behavior',
      description: 'When a user clicks an element.',
      route: RoutePaths.clickBehavior,
    ),
    Link(
      title: 'Hover behavior',
      description:
          'When a user hover over an element (on desktop class devices).',
      route: RoutePaths.hoverBehavior,
    ),
    Link(
      title: 'Focus behavior',
      description:
          'When a user interacts with an element or to make user focus on particular element (mostly an input field or button).',
      route: RoutePaths.focusBehavior,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Interactive behaviors",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
