import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/links.dart';
import '../../../../../navigation/routes.dart';

class EffectsView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'Shadows',
      description: 'Drop shadows and elevation to give widgets depth.',
      route: RoutePaths.shadows,
    ),
    Link(
        title: 'Opacity',
        description: 'Make widgets fully or partially transparent.',
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
