import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/links.dart';
import '../../../../../../core/router/routes.dart';

class DimenionsContraintsView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
      title: 'Fixed dimensions',
      description: 'Dimensions in fixed values.',
      route: RoutePaths.fixedDimensions,
    ),
    LinkItem(
        title: 'Percentage dimensions',
        description: 'Dimensions in percentage to the parent.',
        route: RoutePaths.percentageDimensions),
    LinkItem(
      title: 'Fractional full screen dimensions',
      description: 'Dimensions in fraction to the whole screen.',
      route: RoutePaths.fractionalDimensions,
    ),
    LinkItem(
        title: 'Constraints',
        description: 'Dimensions in max/min.',
        route: RoutePaths.constraints),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Dimensions and constraints",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
