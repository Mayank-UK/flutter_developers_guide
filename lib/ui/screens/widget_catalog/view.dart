import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/links.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../navigation/routes.dart';

class WidgetCatalogView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
        title: 'Accessibility',
        description: 'Make your app accessible.',
        route: RoutePaths.accessibilityWidgets),
    Link(
        title: 'Animations and motion',
        description: 'Bring animations to your app.',
        route: RoutePaths.animationMotionWidgets),
    Link(
        title: 'Assets, icons and images',
        description: 'Manage assets, display images, and show icons.',
        route: RoutePaths.assetWidgets),
    Link(
        title: 'Async',
        description: 'Async patterns to your Flutter application.',
        route: RoutePaths.asyncWidgets),
    Link(
        title: 'Cupertino',
        description:
            'Beautiful and high-fidelity widgets for current iOS design language.',
        route: RoutePaths.cupertinoWidgets),
    Link(
        title: 'Input',
        description:
            'Take user input in addition to input widgets in Material Components and Cupertino.',
        route: RoutePaths.inputWidgets),
    Link(
        title: 'Interactive',
        description:
            'Respond to touch events and route users to different views.',
        route: RoutePaths.interactiveWidgets),
    Link(
        title: 'Layout',
        description:
            'Arrange other widgets columns, rows, grids, and many other layouts.',
        route: RoutePaths.layoutWidgets),
    Link(
        title: 'Material',
        description:
            'Visual, behavioral, and motion-rich widgets implementing the Material Design guidelines.',
        route: RoutePaths.materialWidgets),
    Link(
        title: 'Painting and effects',
        description:
            'These widgets apply visual effects to the children without changing their layout, size, or position.',
        route: RoutePaths.paintingEffectWidgets),
    Link(
        title: 'Scrolling',
        description: 'Scroll multiple widgets as children of the parent.',
        route: RoutePaths.scrollingWidgets),
    Link(
        title: 'Styling',
        description:
            'Manage the theme of your app, makes your app responsive to screen sizes, or add padding.',
        route: RoutePaths.stylingWidgets),
    Link(
        title: 'Text',
        description: 'Display and style text.',
        route: RoutePaths.textWidgets),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Widget catalog",
      mobileUi: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
