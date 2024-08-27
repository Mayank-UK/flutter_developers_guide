import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/links.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../core/router/routes.dart';

class WidgetCatalogView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
        title: 'Accessibility',
        description: 'Make your app accessible.',
        route: RoutePaths.accessibilityWidgets),
    LinkItem(
        title: 'Animations and motion',
        description: 'Bring animations to your app.',
        route: RoutePaths.animationMotionWidgets),
    LinkItem(
        title: 'Assets, icons and images',
        description: 'Manage assets, display images, and show icons.',
        route: RoutePaths.assetWidgets),
    LinkItem(
        title: 'Async',
        description: 'Async patterns to your Flutter application.',
        route: RoutePaths.asyncWidgets),
    LinkItem(
        title: 'Cupertino',
        description:
            'Beautiful and high-fidelity widgets for current iOS design language.',
        route: RoutePaths.cupertinoWidgets),
    LinkItem(
        title: 'Input',
        description:
            'Take user input in addition to input widgets in Material Components and Cupertino.',
        route: RoutePaths.inputWidgets),
    LinkItem(
        title: 'Interactive',
        description:
            'Respond to touch events and route users to different views.',
        route: RoutePaths.interactiveWidgets),
    LinkItem(
        title: 'Layout',
        description:
            'Arrange other widgets columns, rows, grids, and many other layouts.',
        route: RoutePaths.layoutWidgets),
    LinkItem(
        title: 'Material',
        description:
            'Visual, behavioral, and motion-rich widgets implementing the Material Design guidelines.',
        route: RoutePaths.materialWidgets),
    LinkItem(
        title: 'Painting and effects',
        description:
            'These widgets apply visual effects to the children without changing their layout, size, or position.',
        route: RoutePaths.paintingEffectWidgets),
    LinkItem(
        title: 'Scrolling',
        description: 'Scroll multiple widgets as children of the parent.',
        route: RoutePaths.scrollingWidgets),
    LinkItem(
        title: 'Styling',
        description:
            'Manage the theme of your app, makes your app responsive to screen sizes, or add padding.',
        route: RoutePaths.stylingWidgets),
    LinkItem(
        title: 'Text',
        description: 'Display and style text.',
        route: RoutePaths.textWidgets),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Widget catalog",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
