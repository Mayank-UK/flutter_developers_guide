import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../core/router/routes.dart';
import '../../../components/links.dart';

class InteractiveWidgetsView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
      title: 'AbsorbPointer',
      description:
          'A widget that absorbs pointers during hit testing. When absorbing is true, this widget prevents its subtree from receiving pointer events by terminating hit testing at itself. It still consumes space during layout and paints its child as usual. It just prevents its children from being the target of located events, because it returns true from RenderBox.hitTest.',
      route: RoutePaths.absorbPointer,
    ),
    LinkItem(
      title: 'Dismissible',
      description:
          'A widget that can be dismissed by dragging in the indicated direction. Dragging or flinging this widget in the DismissDirection causes the child to slide out of view. Following the slide animation, if resizeDuration is non-null, the Dismissible widget animates its height (or width, whichever is perpendicular to the dismiss direction) to zero over the resizeDuration.',
      route: RoutePaths.dismissible,
    ),
    LinkItem(
      title: 'DragTarget',
      description:
          'A widget that receives data when a Draggable widget is dropped. When a draggable is dragged on top of a drag target, the drag target is asked whether it will accept the data the draggable is carrying. If the user does drop the draggable on top of the drag target (and the drag target has indicated that it will accept the draggable\'s data), then the drag target is asked to accept the draggable\'s data.',
      route: RoutePaths.dragTarget,
    ),
    LinkItem(
      title: 'Draggable',
      description:
          'A widget that can be dragged from to a DragTarget. When a draggable widget recognizes the start of a drag gesture, it displays a feedback widget that tracks the user\'s finger across the screen. If the user lifts their finger while on top of a DragTarget, that target is given the opportunity to accept the data carried by the draggable.',
      route: RoutePaths.draggable,
    ),
    LinkItem(
      title: 'DraggableScrollableSheet',
      description:
          'A container for a Scrollable that responds to drag gestures by resizing the scrollable until a limit is reached, and then scrolling.',
      route: RoutePaths.draggableScrollableSheet,
    ),
    LinkItem(
      title: 'GestureDetector',
      description:
          'A widget that detects gestures. Attempts to recognize gestures that correspond to its non-null callbacks. If this widget has a child, it defers to that child for its sizing behavior. If it does not have a child, it grows to fit the parent instead.',
      route: RoutePaths.gestureDetector,
    ),
    LinkItem(
      title: 'IgnorePointer',
      description:
          'A widget that is invisible during hit testing. When ignoring is true, this widget (and its subtree) is invisible to hit testing. It still consumes space during layout and paints its child as usual. It just cannot be the target of located events, because it returns false from RenderBox.hitTest.',
      route: RoutePaths.ignorePointer,
    ),
    LinkItem(
        title: 'InteractiveViewer',
        description:
            'A widget that enables pan and zoom interactions with its child.',
        route: RoutePaths.interactiveViewer),
    LinkItem(
      title: 'LongPressDraggable',
      description: 'Makes its child draggable starting from long press.',
      route: RoutePaths.longPressDraggable,
    ),
    LinkItem(
      title: 'Scrollable',
      description:
          'Scrollable implements the interaction model for a scrollable widget, including gesture recognition, but does not have an opinion about how the viewport, which actually displays the children, is constructed.',
      route: RoutePaths.scrollable,
    ),
    LinkItem(
      title: 'Hero',
      description:
          'A widget that marks its child as being a candidate for hero animations.',
      route: RoutePaths.hero,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Interactive widgets",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
