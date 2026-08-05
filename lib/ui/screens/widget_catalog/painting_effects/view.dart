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
      description:
          'A widget that clips its child into an oval (a circle when the child is square). Paint-time only — layout and hit-testing stay in the original rectangle.',
      route: RoutePaths.clipOval,
    ),
    Link(
      title: 'ClipPath',
      description:
          'A widget that clips its child to an arbitrary outline you supply via a CustomClipper<Path> — triangles, stars, waves, any silhouette beyond rectangles and ovals.',
      route: RoutePaths.clipPath,
    ),
    Link(
        title: 'ClipRRect',
        description:
            'A widget that clips its child to a rectangle with rounded corners (BorderRadius). The standard way to round an image or widget that has no borderRadius of its own.',
        route: RoutePaths.clipRRect),
    Link(
      title: 'CustomPaint',
      description:
          'A widget that provides a Canvas during the paint phase so a CustomPainter can draw arbitrary graphics — shapes, paths, gradients, charts, sprites.',
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
      description:
          'A widget that makes its child semi-transparent at a given 0.0–1.0 value. Relies on a save-layer, so prefer FadeTransition/AnimatedOpacity for animations.',
      route: RoutePaths.opacity,
    ),
    Link(
        title: 'RotatedBox',
        description:
            'A widget that rotates its child by an integral number of quarter turns during layout, so the rotated footprint participates in sizing and hit-testing.',
        route: RoutePaths.rotatedBox),
    Link(
      title: 'Transform',
      description:
          'A widget that applies a matrix transformation (translate, scale, rotate, skew) before painting its child. Layout stays in the original space — use RotatedBox when layout should follow.',
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
