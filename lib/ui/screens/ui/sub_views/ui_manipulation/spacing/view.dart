import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/links.dart';
import '../../../../../navigation/routes.dart';

class SpacingView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
        title: 'Padding',
        description: 'Empty space between a parent and its child widget.',
        route: RoutePaths.paddingSpacing),
    Link(
      title: 'Margin',
      description: 'Empty space pushed outward from a widget to its neighbors.',
      route: RoutePaths.marginSpacing,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Spacing",
      mobileUi: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
