import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/links.dart';
import '../../../../../navigation/routes.dart';

class SpacingView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
        title: 'Padding',
        description: 'Spacing between parent and it\'s children.',
        route: RoutePaths.paddingSpacing),
    Link(
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
