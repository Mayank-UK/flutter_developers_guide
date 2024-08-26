import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';

import '../../../components/main_appbar.dart';

import '../../../../core/router/routes.dart';
import '../../../components/list.dart';

class ScrollingWidgetsView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
      title: 'CustomScrollView',
      description:
          'A ScrollView that creates custom scroll effects using slivers.',
      route: RoutePaths.customScrollView,
    ),
    ListViewItem(
      title: 'DraggableScrollableSheet',
      description:
          'A container for a Scrollable that responds to drag gestures by resizing the scrollable until a limit is reached, and then scrolling.',
      route: RoutePaths.draggableScrollableSheet,
    ),
    ListViewItem(
        title: 'GridView',
        description:
            'A grid list consists of a repeated pattern of cells arrayed in a vertical and horizontal layout. The GridView widget implements this component.',
        route: RoutePaths.gridView),
    ListViewItem(
      title: 'ListView',
      description:
          'A scrollable, linear list of widgets. ListView is the most commonly used scrolling widget. It displays its children one after another in the scroll direction. In the cross axis, the children are required to fill the ListView.',
      route: RoutePaths.listView,
    ),
    ListViewItem(
      title: 'NestedScrollView',
      description:
          'A scrolling view inside of which can be nested other scrolling views, with their scroll positions being intrinsically linked.',
      route: RoutePaths.nestedScrollView,
    ),
    ListViewItem(
      title: 'NotificationListener',
      description:
          'A widget that listens for Notifications bubbling up the tree.',
      route: RoutePaths.notificationListener,
    ),
    ListViewItem(
      title: 'PageView',
      description: 'A scrollable list that works page by page.',
      route: RoutePaths.pageView,
    ),
    ListViewItem(
      title: 'RefreshIndicator',
      description: 'A Material Design pull-to-refresh wrapper for scrollables',
      route: RoutePaths.refreshIndicator,
    ),
    ListViewItem(
      title: 'ReorderableListView',
      description:
          'A list whose items the user can interactively reorder by dragging.',
      route: RoutePaths.reorderableListView,
    ),
    ListViewItem(
      title: 'ScrollConfiguration',
      description: 'Controls how Scrollable widgets behave in a subtree.',
      route: RoutePaths.scrollConfiguration,
    ),
    ListViewItem(
      title: 'Scrollable',
      description:
          'Scrollable implements the interaction model for a scrollable widget, including gesture recognition, but does not have an opinion about how the viewport, which actually displays the children, is constructed.',
      route: RoutePaths.scrollable,
    ),
    ListViewItem(
      title: 'Scrollbar',
      description:
          'A Material Design scrollbar. A scrollbar indicates which portion of a Scrollable widget is actually visible.',
      route: RoutePaths.scrollbar,
    ),
    ListViewItem(
      title: 'SingleChildScrollView',
      description:
          'A box in which a single widget can be scrolled. This widget is useful when you have a single box that will normally be entirely visible, for example a clock face in a time picker, but you need to make sure it can be scrolled if the container gets too small in one axis (the scroll direction).',
      route: RoutePaths.singleChildScrollView,
    ),
  ];

  final String _appBarTitle = 'Scrolling widgets';

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
