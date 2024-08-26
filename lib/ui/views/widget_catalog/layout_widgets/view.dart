import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';

import '../../../components/main_appbar.dart';

import '../../../../core/router/routes.dart';
import '../../../components/list.dart';

class LayoutWidgetsView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
      title: 'Align',
      description:
          'A widget that aligns its child within itself and optionally sizes itself based on the child\'s size.',
      route: RoutePaths.align,
    ),
    ListViewItem(
      title: 'AspectRatio',
      description:
          'A widget that attempts to size the child to a specific aspect ratio.',
      route: RoutePaths.aspectRatio,
    ),
    ListViewItem(
      title: 'Baseline',
      description:
          'A widget that positions its child according to the child\'s baseline.',
      route: RoutePaths.baseline,
    ),
    ListViewItem(
      title: 'Center',
      description: 'A widget that centers its child within itself.',
      route: RoutePaths.center,
    ),
    ListViewItem(
      title: 'ConstrainedBox',
      description: 'A widget that imposes additional constraints on its child.',
      route: RoutePaths.constrainedBox,
    ),
    ListViewItem(
      title: 'Container',
      description:
          'A convenience widget that combines common painting, positioning, and sizing widgets.',
      route: RoutePaths.container,
    ),
    ListViewItem(
      title: 'CustomSingleChildLayout',
      description:
          'A widget that defers the layout of its single child to a delegate.',
      route: RoutePaths.customSingleChildLayout,
    ),
    ListViewItem(
      title: 'Expanded',
      description: 'A widget that expands a child of a Row, Column, or Flex.',
      route: RoutePaths.expanded,
    ),
    ListViewItem(
      title: 'FittedBox',
      description:
          'Scales and positions its child within itself according to fit.',
      route: RoutePaths.fittedBox,
    ),
    ListViewItem(
      title: 'FractionallySizedBox',
      description:
          'A widget that sizes its child to a fraction of the total available space. For more details about the layout algorithm, see RenderFractionallySizedOverflowBox.',
      route: RoutePaths.fractionallySizedBox,
    ),
    ListViewItem(
      title: 'IntrinsicHeight',
      description:
          'A widget that sizes its child to the child\'s intrinsic height.',
      route: RoutePaths.intrinsicHeight,
    ),
    ListViewItem(
      title: 'IntrinsicWidth',
      description:
          'A widget that sizes its child to the child\'s intrinsic width.',
      route: RoutePaths.intrinsicWidth,
    ),
    ListViewItem(
      title: 'LimitedBox',
      description: 'A box that limits its size only when it\'s unconstrained.',
      route: RoutePaths.limitedBox,
    ),
    ListViewItem(
      title: 'OffStage',
      description:
          'A widget that lays the child out as if it was in the tree, but without painting anything, without making the child available for hit testing, and without taking any room in the parent.',
      route: RoutePaths.offStage,
    ),
    ListViewItem(
      title: 'OverflowBox',
      description:
          'A widget that imposes different constraints on its child than it gets from its parent, possibly allowing the child to overflow the parent.',
      route: RoutePaths.overflowBox,
    ),
    ListViewItem(
      title: 'Padding',
      description: 'A widget that insets its child by the given padding.',
      route: RoutePaths.padding,
    ),
    ListViewItem(
      title: 'SizedBox',
      description:
          'A box with a specified size. If given a child, this widget forces its child to have a specific width and/or height (assuming values are permitted by this widget\'s parent). If either the width or height is null, this widget will size itself to match the child\'s size in that dimension.',
      route: RoutePaths.sizedBox,
    ),
    ListViewItem(
      title: 'SizedOverflowBox',
      description:
          'A widget that is a specific size but passes its original constraints through to its child, which will probably overflow.',
      route: RoutePaths.sizedOverflowBox,
    ),
    ListViewItem(
      title: 'Transform',
      description:
          'A widget that applies a transformation before painting its child.',
      route: RoutePaths.transform,
    ),
    ListViewItem(
      title: 'Column',
      description: 'Layout a list of child widgets in the vertical direction.',
      route: RoutePaths.column,
    ),
    ListViewItem(
      title: 'CustomMultiChildLayout',
      description:
          'A widget that uses a delegate to size and position multiple children.',
      route: RoutePaths.customMultiChildLayout,
    ),
    ListViewItem(
      title: 'Flow',
      description: 'A widget that implements the flow layout algorithm.',
      route: RoutePaths.flow,
    ),
    ListViewItem(
      title: 'GridView',
      description:
          'A grid list consists of a repeated pattern of cells arrayed in a vertical and horizontal layout. The GridView widget implements this component.',
      route: RoutePaths.gridView,
    ),
    ListViewItem(
      title: 'IndexedStack',
      description: 'A Stack that shows a single child from a list of children.',
      route: RoutePaths.indexedStack,
    ),
    ListViewItem(
      title: 'LayoutBuilder',
      description:
          'Builds a widget tree that can depend on the parent widget\'s size.',
      route: RoutePaths.layoutBuilder,
    ),
    ListViewItem(
      title: 'ListBody',
      description:
          'A widget that arranges its children sequentially along a given axis, forcing them to the dimension of the parent in the other axis.',
      route: RoutePaths.listBody,
    ),
    ListViewItem(
      title: 'ListView',
      description:
          'A scrollable, linear list of widgets. ListView is the most commonly used scrolling widget. It displays its children one after another in the scroll direction. In the cross axis, the children are required to fill the ListView.',
      route: RoutePaths.listView,
    ),
    ListViewItem(
      title: 'Row',
      description:
          'Layout a list of child widgets in the horizontal direction.',
      route: RoutePaths.row,
    ),
    ListViewItem(
      title: 'Stack',
      description:
          'This class is useful if you want to overlap several children in a simple way, for example having some text and an image, overlaid with a gradient and a button attached to the bottom.',
      route: RoutePaths.stack,
    ),
    ListViewItem(
      title: 'Table',
      description:
          'A widget that uses the table layout algorithm for its children.',
      route: RoutePaths.table,
    ),
    ListViewItem(
      title: 'Wrap',
      description:
          'A widget that displays its children in multiple horizontal or vertical runs.',
      route: RoutePaths.wrap,
    ),
    ListViewItem(
      title: 'CupertinoSliverNavigationBar',
      description:
          'An iOS-styled navigation bar with iOS-11-style large titles using slivers.',
      route: RoutePaths.cupertinoSliverNavigationBar,
    ),
    ListViewItem(
      title: 'CustomScrollView',
      description:
          'A ScrollView that creates custom scroll effects using slivers.',
      route: RoutePaths.customScrollView,
    ),
    ListViewItem(
        title: 'SliverAppBar',
        description:
            'A material design app bar that integrates with a CustomScrollView.',
        route: RoutePaths.sliverAppBar),
    ListViewItem(
      title: 'SliverChildBuilderDelegate',
      description:
          'A delegate that supplies children for slivers using a builder callback.',
      route: RoutePaths.sliverChildBuilderDelegate,
    ),
    ListViewItem(
      title: 'SliverChildListDelegate',
      description:
          'A delegate that supplies children for slivers using an explicit list.',
      route: RoutePaths.sliverChildListDelegate,
    ),
    ListViewItem(
      title: 'SliverFixedExtentList',
      description:
          'A sliver that places multiple box children with the same main axis extent in a linear array.',
      route: RoutePaths.sliverFixedExtentList,
    ),
    ListViewItem(
      title: 'SliverGrid',
      description:
          'A sliver that places multiple box children in a two dimensional arrangement.',
      route: RoutePaths.sliverGrid,
    ),
    ListViewItem(
      title: 'SliverList',
      description:
          'A sliver that places multiple box children in a linear array along the main axis.',
      route: RoutePaths.sliverList,
    ),
    ListViewItem(
      title: 'SliverPadding',
      description:
          'A sliver that applies padding on each side of another sliver.',
      route: RoutePaths.sliverPadding,
    ),
    ListViewItem(
      title: 'SliverPersistentHeader',
      description:
          'A sliver that applies padding on each side of another sliver.',
      route: RoutePaths.sliverPersistentHeader,
    ),
    ListViewItem(
      title: 'SliverToBoxAdaptor',
      description: 'A sliver that contains a single box widget.',
      route: RoutePaths.sliverToBoxAdaptor,
    ),
  ];

  final String _appBarTitle = 'Layout widgets';

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
