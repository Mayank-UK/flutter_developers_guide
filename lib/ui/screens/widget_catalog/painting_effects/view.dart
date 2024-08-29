import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../navigation/routes.dart';
import '../../../components/links.dart';

class PaintingEffectsWidgetsView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'BackdropFilter',
      description:
          'A widget that applies a filter to the existing painted content and then paints a child. This effect is relatively expensive, especially if the filter is non-local, such as a blur.',
      route: RoutePaths.backDropFilter,
    ),
    Link(
      title: 'ClipOval',
      description: 'A widget that clips its child using an oval.',
      route: RoutePaths.clipOval,
    ),
    Link(
      title: 'ClipPath',
      description: 'A widget that clips its child using a path.',
      route: RoutePaths.clipPath,
    ),
    Link(
        title: 'ClipRRect',
        description: 'A widget that clips its child using a rectangle.',
        route: RoutePaths.clipRRect),
    Link(
      title: 'CustomPaint',
      description:
          'A widget that provides a canvas on which to draw during the paint phase.',
      route: RoutePaths.customPaint,
    ),
    Link(
      title: 'DecoratedBox',
      description:
          'A widget that paints a Decoration either before or after its child paints.',
      route: RoutePaths.decoratedBox,
    ),
    Link(
      title: 'FractionalTranslation',
      description:
          'A widget that applies a translation expressed as a fraction of the box\'s size before painting its child.',
      route: RoutePaths.fractionalTranslation,
    ),
    Link(
      title: 'Opacity',
      description: 'A widget that makes its child partially transparent.',
      route: RoutePaths.opacity,
    ),
    Link(
        title: 'RotatedBox',
        description:
            'A widget that rotates its child by a integral number of quarter turns.',
        route: RoutePaths.rotatedBox),
    Link(
      title: 'Transform',
      description:
          'A widget that applies a transformation before painting its child.',
      route: RoutePaths.transform,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "PaintingEffects",
      mobileUi: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
