import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/links.dart';
import '../../../../../navigation/routes.dart';

class DimenionsContraintsView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'Fixed dimensions',
      description: 'Dimensions in fixed values.',
      route: RoutePaths.fixedDimensions,
    ),
    Link(
        title: 'Percentage dimensions',
        description: 'Dimensions in percentage to the parent.',
        route: RoutePaths.percentageDimensions),
    Link(
      title: 'Fractional full screen dimensions',
      description: 'Dimensions in fraction to the whole screen.',
      route: RoutePaths.fractionalDimensions,
    ),
    Link(
        title: 'Constraints',
        description: 'Dimensions in max/min.',
        route: RoutePaths.constraints),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Dimensions and constraints",
      mobileUi: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
