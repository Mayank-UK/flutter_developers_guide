import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/links.dart';
import '../../../../../navigation/routes.dart';

class DimenionsContraintsView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'Fixed dimensions',
      description: 'Pin a widget to an exact width and height in pixels.',
      route: RoutePaths.fixedDimensions,
    ),
    Link(
        title: 'Percentage dimensions',
        description: 'Size a widget as a fraction of its parent.',
        route: RoutePaths.percentageDimensions),
    Link(
      title: 'Fractional full screen dimensions',
      description: 'Size a widget as a fraction of the whole screen.',
      route: RoutePaths.fractionalDimensions,
    ),
    Link(
        title: 'Constraints',
        description: 'Bound a widget between min and max width/height.',
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
