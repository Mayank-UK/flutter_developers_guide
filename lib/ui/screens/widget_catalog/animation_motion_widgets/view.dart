import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../navigation/routes.dart';

import '../../../components/links.dart';

class AnimationWidgetsView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'AnimatedAlign',
      description:
          'Animated version of Align which automatically transitions the child\'s position over a given duration whenever the given alignment changes.',
      route: RoutePaths.animatedAlign,
    ),
    Link(
      title: 'AnimatedBuilder',
      description:
          'A general-purpose widget for building animations. AnimatedBuilder is useful for more complex widgets that wish to include animation as part of a larger build function. To use AnimatedBuilder, simply construct the widget and pass it a builder function.',
      route: RoutePaths.animatedBuilder,
    ),
    Link(
        title: 'AnimatedContainer',
        description:
            'A container that gradually changes its values over a period of time.',
        route: RoutePaths.animatedContainer),
    Link(
      title: 'AnimatedCrossFade',
      description:
          'A widget that cross-fades between two given children and animates itself between their sizes.',
      route: RoutePaths.animatedCrossFade,
    ),
    Link(
      title: 'AnimatedDefaultTextStyle',
      description:
          'Animated version of DefaultTextStyle which automatically transitions the default text style (the text style to apply to descendant Text widgets without explicit style) over a given duration whenever the given style changes.',
      route: RoutePaths.animatedDefaultTextStyle,
    ),
    Link(
        title: 'AnimatedListState',
        description:
            'The state for a scrolling container that animates items when they are inserted or removed.',
        route: RoutePaths.animatedListState),
    Link(
      title: 'AnimatedModalBarrier',
      description:
          'A widget that prevents the user from interacting with widgets behind itself.',
      route: RoutePaths.animatedModalBarrier,
    ),
    Link(
      title: 'AnimatedOpacity',
      description:
          'Animated version of Opacity which automatically transitions the child\'s opacity over a given duration whenever the given opacity changes.',
      route: RoutePaths.animatedOpacity,
    ),
    Link(
      title: 'AnimatedPhysicalModel',
      description: 'Animated version of PhysicalModel.',
      route: RoutePaths.animatedPhysicalModel,
    ),
    Link(
      title: 'AnimatedPositioned',
      description:
          'Animated version of Positioned which automatically transitions the child\'s position over a given duration whenever the given position changes.',
      route: RoutePaths.animatedPositioned,
    ),
    Link(
        title: 'AnimatedSize',
        description:
            'Animated widget that automatically transitions its size over a given duration whenever the given child\'s size changes.',
        route: RoutePaths.animatedSize),
    Link(
        title: 'AnimatedWidget',
        description:
            'A widget that rebuilds when the given Listenable changes value.',
        route: RoutePaths.animatedWidget),
    Link(
      title: 'AnimatedWidgetBaseState',
      description: 'A base class for widgets with implicit animations.',
      route: RoutePaths.animatedWidgetBaseState,
    ),
    Link(
      title: 'DecoratedBoxTransition',
      description:
          'Animated version of a DecoratedBox that animates the different properties of its Decoration.',
      route: RoutePaths.decoratedBoxTransition,
    ),
    Link(
      title: 'FadeTransition',
      description: 'Animates the opacity of a widget.',
      route: RoutePaths.fadeTransition,
    ),
    Link(
      title: 'Hero',
      description:
          'A widget that marks its child as being a candidate for hero animations.',
      route: RoutePaths.hero,
    ),
    Link(
        title: 'PositionedTransition',
        description:
            'Animated version of Positioned which takes a specific Animation to transition the child\'s position from a start position to and end position over the lifetime of the animation.',
        route: RoutePaths.positionedTransition),
    Link(
      title: 'RotationTransition',
      description: 'Animates the rotation of a widget.',
      route: RoutePaths.rotationTransition,
    ),
    Link(
      title: 'ScaleTransition',
      description: 'Animates the scale of transformed widget.',
      route: RoutePaths.scaleTransition,
    ),
    Link(
      title: 'SizeTransition',
      description: 'Animates its own size and clips and aligns the child.',
      route: RoutePaths.sizeTransition,
    ),
    Link(
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
