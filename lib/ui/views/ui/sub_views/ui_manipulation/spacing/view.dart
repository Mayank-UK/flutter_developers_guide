import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/links.dart';
import '../../../../../../core/router/routes.dart';

class SpacingView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
        title: 'Padding',
        description: 'Spacing between parent and it\'s children.',
        route: RoutePaths.paddingSpacing),
    LinkItem(
      title: 'Margin',
      description: 'Spacing from the surrounding elements.',
      route: RoutePaths.marginSpacing,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Spacing",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
