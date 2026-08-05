import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../navigation/routes.dart';
import '../../../components/links.dart';

class ScrollingWidgetsView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'CustomScrollView',
      description:
          'A ScrollView that composes slivers — SliverAppBar, SliverList, SliverGrid, SliverPersistentHeader — to build custom scroll effects such as collapsing app bars and mixed list/grid sections in one scroll.',
      route: RoutePaths.customScrollView,
    ),
    Link(
      title: 'DraggableScrollableSheet',
      description:
          'A container for a Scrollable that responds to drag gestures by resizing the scrollable until a limit is reached, and then scrolling.',
      route: RoutePaths.draggableScrollableSheet,
    ),
    Link(
        title: 'GridView',
        description:
            'A grid list consists of a repeated pattern of cells arrayed in a vertical and horizontal layout. The GridView widget implements this component.',
        route: RoutePaths.gridView),
    Link(
      title: 'ListView',
      description:
          'A scrollable, linear list of widgets. ListView is the most commonly used scrolling widget. It displays its children one after another in the scroll direction. In the cross axis, the children are required to fill the ListView.',
      route: RoutePaths.listView,
    ),
    Link(
      title: 'NestedScrollView',
      description:
          'A scrolling view inside of which can be nested other scrolling views, with their scroll positions being intrinsically linked.',
      route: RoutePaths.nestedScrollView,
    ),
    Link(
      title: 'NotificationListener',
      description:
          'A widget that listens for Notifications bubbling up the tree and can intercept them. Most often used to observe ScrollNotification from any scrollable without holding its controller.',
      route: RoutePaths.notificationListener,
    ),
    Link(
      title: 'PageView',
      description:
          'A scrollable that snaps its children into discrete full-screen pages. Powers onboarding flows, image carousels, and paged tab content; drive it with a PageController.',
      route: RoutePaths.pageView,
    ),
    Link(
      title: 'RefreshIndicator',
      description:
          'A Material Design pull-to-refresh wrapper. Shows the spinner on overscroll and awaits onRefresh (a Future) to complete before retreating.',
      route: RoutePaths.refreshIndicator,
    ),
    Link(
      title: 'ReorderableListView',
      description:
          'A list whose items the user can interactively reorder by dragging.',
      route: RoutePaths.reorderableListView,
    ),
    Link(
      title: 'ScrollConfiguration',
      description:
          'Controls how Scrollable widgets behave in a subtree — ScrollPhysics, overscroll appearance, and gesture conventions. The seam through which iOS bounce vs. Android clamping is applied.',
      route: RoutePaths.scrollConfiguration,
    ),
    Link(
      title: 'Scrollable',
      description:
          'Scrollable implements the interaction model for a scrollable widget, including gesture recognition, but does not have an opinion about how the viewport, which actually displays the children, is constructed.',
      route: RoutePaths.scrollable,
    ),
    Link(
      title: 'Scrollbar',
      description:
          'A Material Design scrollbar. A scrollbar indicates which portion of a Scrollable widget is actually visible.',
      route: RoutePaths.scrollbar,
    ),
    Link(
      title: 'SingleChildScrollView',
      description:
          'A box in which a single widget can be scrolled. This widget is useful when you have a single box that will normally be entirely visible, for example a clock face in a time picker, but you need to make sure it can be scrolled if the container gets too small in one axis (the scroll direction).',
      route: RoutePaths.singleChildScrollView,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Scrolling widgets",
      mobileUi: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
