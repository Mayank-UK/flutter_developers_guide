import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../core/router/routes.dart';
import '../../../components/links.dart';

class LayoutWidgetsView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
      title: 'Align',
      description:
          'A widget that aligns its child within itself and optionally sizes itself based on the child\'s size.',
      route: RoutePaths.align,
    ),
    LinkItem(
      title: 'AspectRatio',
      description:
          'A widget that attempts to size the child to a specific aspect ratio.',
      route: RoutePaths.aspectRatio,
    ),
    LinkItem(
      title: 'Baseline',
      description:
          'A widget that positions its child according to the child\'s baseline.',
      route: RoutePaths.baseline,
    ),
    LinkItem(
      title: 'Center',
      description: 'A widget that centers its child within itself.',
      route: RoutePaths.center,
    ),
    LinkItem(
      title: 'ConstrainedBox',
      description: 'A widget that imposes additional constraints on its child.',
      route: RoutePaths.constrainedBox,
    ),
    LinkItem(
      title: 'Container',
      description:
          'A convenience widget that combines common painting, positioning, and sizing widgets.',
      route: RoutePaths.container,
    ),
    LinkItem(
      title: 'CustomSingleChildLayout',
      description:
          'A widget that defers the layout of its single child to a delegate.',
      route: RoutePaths.customSingleChildLayout,
    ),
    LinkItem(
      title: 'Expanded',
      description: 'A widget that expands a child of a Row, Column, or Flex.',
      route: RoutePaths.expanded,
    ),
    LinkItem(
      title: 'FittedBox',
      description:
          'Scales and positions its child within itself according to fit.',
      route: RoutePaths.fittedBox,
    ),
    LinkItem(
      title: 'FractionallySizedBox',
      description:
          'A widget that sizes its child to a fraction of the total available space. For more details about the layout algorithm, see RenderFractionallySizedOverflowBox.',
      route: RoutePaths.fractionallySizedBox,
    ),
    LinkItem(
      title: 'IntrinsicHeight',
      description:
          'A widget that sizes its child to the child\'s intrinsic height.',
      route: RoutePaths.intrinsicHeight,
    ),
    LinkItem(
      title: 'IntrinsicWidth',
      description:
          'A widget that sizes its child to the child\'s intrinsic width.',
      route: RoutePaths.intrinsicWidth,
    ),
    LinkItem(
      title: 'LimitedBox',
      description: 'A box that limits its size only when it\'s unconstrained.',
      route: RoutePaths.limitedBox,
    ),
    LinkItem(
      title: 'OffStage',
      description:
          'A widget that lays the child out as if it was in the tree, but without painting anything, without making the child available for hit testing, and without taking any room in the parent.',
      route: RoutePaths.offStage,
    ),
    LinkItem(
      title: 'OverflowBox',
      description:
          'A widget that imposes different constraints on its child than it gets from its parent, possibly allowing the child to overflow the parent.',
      route: RoutePaths.overflowBox,
    ),
    LinkItem(
      title: 'Padding',
      description: 'A widget that insets its child by the given padding.',
      route: RoutePaths.padding,
    ),
    LinkItem(
      title: 'SizedBox',
      description:
          'A box with a specified size. If given a child, this widget forces its child to have a specific width and/or height (assuming values are permitted by this widget\'s parent). If either the width or height is null, this widget will size itself to match the child\'s size in that dimension.',
      route: RoutePaths.sizedBox,
    ),
    LinkItem(
      title: 'SizedOverflowBox',
      description:
          'A widget that is a specific size but passes its original constraints through to its child, which will probably overflow.',
      route: RoutePaths.sizedOverflowBox,
    ),
    LinkItem(
      title: 'Transform',
      description:
          'A widget that applies a transformation before painting its child.',
      route: RoutePaths.transform,
    ),
    LinkItem(
      title: 'Column',
      description: 'Layout a list of child widgets in the vertical direction.',
      route: RoutePaths.column,
    ),
    LinkItem(
      title: 'CustomMultiChildLayout',
      description:
          'A widget that uses a delegate to size and position multiple children.',
      route: RoutePaths.customMultiChildLayout,
    ),
    LinkItem(
      title: 'Flow',
      description: 'A widget that implements the flow layout algorithm.',
      route: RoutePaths.flow,
    ),
    LinkItem(
      title: 'GridView',
      description:
          'A grid list consists of a repeated pattern of cells arrayed in a vertical and horizontal layout. The GridView widget implements this component.',
      route: RoutePaths.gridView,
    ),
    LinkItem(
      title: 'IndexedStack',
      description: 'A Stack that shows a single child from a list of children.',
      route: RoutePaths.indexedStack,
    ),
    LinkItem(
      title: 'LayoutBuilder',
      description:
          'Builds a widget tree that can depend on the parent widget\'s size.',
      route: RoutePaths.layoutBuilder,
    ),
    LinkItem(
      title: 'ListBody',
      description:
          'A widget that arranges its children sequentially along a given axis, forcing them to the dimension of the parent in the other axis.',
      route: RoutePaths.listBody,
    ),
    LinkItem(
      title: 'ListView',
      description:
          'A scrollable, linear list of widgets. ListView is the most commonly used scrolling widget. It displays its children one after another in the scroll direction. In the cross axis, the children are required to fill the ListView.',
      route: RoutePaths.listView,
    ),
    LinkItem(
      title: 'Row',
      description:
          'Layout a list of child widgets in the horizontal direction.',
      route: RoutePaths.row,
    ),
    LinkItem(
      title: 'Stack',
      description:
          'This class is useful if you want to overlap several children in a simple way, for example having some text and an image, overlaid with a gradient and a button attached to the bottom.',
      route: RoutePaths.stack,
    ),
    LinkItem(
      title: 'Table',
      description:
          'A widget that uses the table layout algorithm for its children.',
      route: RoutePaths.table,
    ),
    LinkItem(
      title: 'Wrap',
      description:
          'A widget that displays its children in multiple horizontal or vertical runs.',
      route: RoutePaths.wrap,
    ),
    LinkItem(
      title: 'CupertinoSliverNavigationBar',
      description:
          'An iOS-styled navigation bar with iOS-11-style large titles using slivers.',
      route: RoutePaths.cupertinoSliverNavigationBar,
    ),
    LinkItem(
      title: 'CustomScrollView',
      description:
          'A ScrollView that creates custom scroll effects using slivers.',
      route: RoutePaths.customScrollView,
    ),
    LinkItem(
        title: 'SliverAppBar',
        description:
            'A material design app bar that integrates with a CustomScrollView.',
        route: RoutePaths.sliverAppBar),
    LinkItem(
      title: 'SliverChildBuilderDelegate',
      description:
          'A delegate that supplies children for slivers using a builder callback.',
      route: RoutePaths.sliverChildBuilderDelegate,
    ),
    LinkItem(
      title: 'SliverChildListDelegate',
      description:
          'A delegate that supplies children for slivers using an explicit list.',
      route: RoutePaths.sliverChildListDelegate,
    ),
    LinkItem(
      title: 'SliverFixedExtentList',
      description:
          'A sliver that places multiple box children with the same main axis extent in a linear array.',
      route: RoutePaths.sliverFixedExtentList,
    ),
    LinkItem(
      title: 'SliverGrid',
      description:
          'A sliver that places multiple box children in a two dimensional arrangement.',
      route: RoutePaths.sliverGrid,
    ),
    LinkItem(
      title: 'SliverList',
      description:
          'A sliver that places multiple box children in a linear array along the main axis.',
      route: RoutePaths.sliverList,
    ),
    LinkItem(
      title: 'SliverPadding',
      description:
          'A sliver that applies padding on each side of another sliver.',
      route: RoutePaths.sliverPadding,
    ),
    LinkItem(
      title: 'SliverPersistentHeader',
      description:
          'A sliver that applies padding on each side of another sliver.',
      route: RoutePaths.sliverPersistentHeader,
    ),
    LinkItem(
      title: 'SliverToBoxAdaptor',
      description: 'A sliver that contains a single box widget.',
      route: RoutePaths.sliverToBoxAdaptor,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Layout widgets",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
