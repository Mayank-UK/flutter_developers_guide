import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';

import '../../../components/main_appbar.dart';

import '../../../../core/router/routes.dart';
import '../../../components/list.dart';

class PaintingEffectsWidgetsView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
      title: 'BackdropFilter',
      description:
          'A widget that applies a filter to the existing painted content and then paints a child. This effect is relatively expensive, especially if the filter is non-local, such as a blur.',
      route: RoutePaths.backDropFilter,
    ),
    ListViewItem(
      title: 'ClipOval',
      description: 'A widget that clips its child using an oval.',
      route: RoutePaths.clipOval,
    ),
    ListViewItem(
      title: 'ClipPath',
      description: 'A widget that clips its child using a path.',
      route: RoutePaths.clipPath,
    ),
    ListViewItem(
        title: 'ClipRRect',
        description: 'A widget that clips its child using a rectangle.',
        route: RoutePaths.clipRRect),
    ListViewItem(
      title: 'CustomPaint',
      description:
          'A widget that provides a canvas on which to draw during the paint phase.',
      route: RoutePaths.customPaint,
    ),
    ListViewItem(
      title: 'DecoratedBox',
      description:
          'A widget that paints a Decoration either before or after its child paints.',
      route: RoutePaths.decoratedBox,
    ),
    ListViewItem(
      title: 'FractionalTranslation',
      description:
          'A widget that applies a translation expressed as a fraction of the box\'s size before painting its child.',
      route: RoutePaths.fractionalTranslation,
    ),
    ListViewItem(
      title: 'Opacity',
      description: 'A widget that makes its child partially transparent.',
      route: RoutePaths.opacity,
    ),
    ListViewItem(
        title: 'RotatedBox',
        description:
            'A widget that rotates its child by a integral number of quarter turns.',
        route: RoutePaths.rotatedBox),
    ListViewItem(
      title: 'Transform',
      description:
          'A widget that applies a transformation before painting its child.',
      route: RoutePaths.transform,
    ),
  ];

  final String _appBarTitle = 'PaintingEffects';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: Links(
        itemList: _itemList,
      ),
    );
  }
}
