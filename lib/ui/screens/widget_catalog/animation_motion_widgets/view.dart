import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../navigation/routes.dart';

import '../../../components/links.dart';

class AnimationWidgetsView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
      title: 'AnimatedAlign',
      description:
          'Animated version of Align which automatically transitions the child\'s position over a given duration whenever the given alignment changes.',
      route: RoutePaths.animatedAlign,
    ),
    LinkItem(
      title: 'AnimatedBuilder',
      description:
          'A general-purpose widget for building animations. AnimatedBuilder is useful for more complex widgets that wish to include animation as part of a larger build function. To use AnimatedBuilder, simply construct the widget and pass it a builder function.',
      route: RoutePaths.animatedBuilder,
    ),
    LinkItem(
        title: 'AnimatedContainer',
        description:
            'A container that gradually changes its values over a period of time.',
        route: RoutePaths.animatedContainer),
    LinkItem(
      title: 'AnimatedCrossFade',
      description:
          'A widget that cross-fades between two given children and animates itself between their sizes.',
      route: RoutePaths.animatedCrossFade,
    ),
    LinkItem(
      title: 'AnimatedDefaultTextStyle',
      description:
          'Animated version of DefaultTextStyle which automatically transitions the default text style (the text style to apply to descendant Text widgets without explicit style) over a given duration whenever the given style changes.',
      route: RoutePaths.animatedDefaultTextStyle,
    ),
    LinkItem(
        title: 'AnimatedListState',
        description:
            'The state for a scrolling container that animates items when they are inserted or removed.',
        route: RoutePaths.animatedListState),
    LinkItem(
      title: 'AnimatedModalBarrier',
      description:
          'A widget that prevents the user from interacting with widgets behind itself.',
      route: RoutePaths.animatedModalBarrier,
    ),
    LinkItem(
      title: 'AnimatedOpacity',
      description:
          'Animated version of Opacity which automatically transitions the child\'s opacity over a given duration whenever the given opacity changes.',
      route: RoutePaths.animatedOpacity,
    ),
    LinkItem(
      title: 'AnimatedPhysicalModel',
      description: 'Animated version of PhysicalModel.',
      route: RoutePaths.animatedPhysicalModel,
    ),
    LinkItem(
      title: 'AnimatedPositioned',
      description:
          'Animated version of Positioned which automatically transitions the child\'s position over a given duration whenever the given position changes.',
      route: RoutePaths.animatedPositioned,
    ),
    LinkItem(
        title: 'AnimatedSize',
        description:
            'Animated widget that automatically transitions its size over a given duration whenever the given child\'s size changes.',
        route: RoutePaths.animatedSize),
    LinkItem(
        title: 'AnimatedWidget',
        description:
            'A widget that rebuilds when the given Listenable changes value.',
        route: RoutePaths.animatedWidget),
    LinkItem(
      title: 'AnimatedWidgetBaseState',
      description: 'A base class for widgets with implicit animations.',
      route: RoutePaths.animatedWidgetBaseState,
    ),
    LinkItem(
      title: 'DecoratedBoxTransition',
      description:
          'Animated version of a DecoratedBox that animates the different properties of its Decoration.',
      route: RoutePaths.decoratedBoxTransition,
    ),
    LinkItem(
      title: 'FadeTransition',
      description: 'Animates the opacity of a widget.',
      route: RoutePaths.fadeTransition,
    ),
    LinkItem(
      title: 'Hero',
      description:
          'A widget that marks its child as being a candidate for hero animations.',
      route: RoutePaths.hero,
    ),
    LinkItem(
        title: 'PositionedTransition',
        description:
            'Animated version of Positioned which takes a specific Animation to transition the child\'s position from a start position to and end position over the lifetime of the animation.',
        route: RoutePaths.positionedTransition),
    LinkItem(
      title: 'RotationTransition',
      description: 'Animates the rotation of a widget.',
      route: RoutePaths.rotationTransition,
    ),
    LinkItem(
      title: 'ScaleTransition',
      description: 'Animates the scale of transformed widget.',
      route: RoutePaths.scaleTransition,
    ),
    LinkItem(
      title: 'SizeTransition',
      description: 'Animates its own size and clips and aligns the child.',
      route: RoutePaths.sizeTransition,
    ),
    LinkItem(
      title: 'SlideTransition',
      description:
          'Animates the position of a widget relative to its normal position.',
      route: RoutePaths.slideTransition,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Animation widgets",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
