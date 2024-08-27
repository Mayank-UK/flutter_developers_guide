import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/links.dart';
import '../../../../../../core/router/routes.dart';

class InteractiveBehaviorView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
      title: 'Click/tap behavior',
      description: 'When a user clicks an element.',
      route: RoutePaths.clickBehavior,
    ),
    LinkItem(
      title: 'Hover behavior',
      description:
          'When a user hover over an element (on desktop class devices).',
      route: RoutePaths.hoverBehavior,
    ),
    LinkItem(
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
