import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/links.dart';
import '../../../../../../core/router/routes.dart';

class EffectsView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
      title: 'Shadows',
      description: 'Shadows of widgets.',
      route: RoutePaths.shadows,
    ),
    LinkItem(
        title: 'Opacity',
        description: 'Opacity of widgets.',
        route: RoutePaths.opacityEffect),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Effects",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
