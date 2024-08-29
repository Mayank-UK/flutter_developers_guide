import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/links.dart';
import '../../../../../navigation/routes.dart';

class EffectsView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'Shadows',
      description: 'Shadows of widgets.',
      route: RoutePaths.shadows,
    ),
    Link(
        title: 'Opacity',
        description: 'Opacity of widgets.',
        route: RoutePaths.opacityEffect),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Effects",
      mobileUi: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
