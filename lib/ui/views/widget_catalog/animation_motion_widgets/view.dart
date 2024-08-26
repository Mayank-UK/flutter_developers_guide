import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';

import '../../../../core/router/routes.dart';

import '../../../components/main_appbar.dart';
import '../../../components/list.dart';

class AnimationWidgetsView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
      title: 'AnimatedAlign',
      description:
          'Animated version of Align which automatically transitions the child\'s position over a given duration whenever the given alignment changes.',
      route: RoutePaths.animatedAlign,
    ),
    ListViewItem(
      title: 'AnimatedBuilder',
      description:
          'A general-purpose widget for building animations. AnimatedBuilder is useful for more complex widgets that wish to include animation as part of a larger build function. To use AnimatedBuilder, simply construct the widget and pass it a builder function.',
      route: RoutePaths.animatedBuilder,
    ),
    ListViewItem(
        title: 'AnimatedContainer',
        description:
            'A container that gradually changes its values over a period of time.',
        route: RoutePaths.animatedContainer),
    ListViewItem(
      title: 'AnimatedCrossFade',
      description:
          'A widget that cross-fades between two given children and animates itself between their sizes.',
      route: RoutePaths.animatedCrossFade,
    ),
    ListViewItem(
      title: 'AnimatedDefaultTextStyle',
      description:
          'Animated version of DefaultTextStyle which automatically transitions the default text style (the text style to apply to descendant Text widgets without explicit style) over a given duration whenever the given style changes.',
      route: RoutePaths.animatedDefaultTextStyle,
    ),
    ListViewItem(
        title: 'AnimatedListState',
        description:
            'The state for a scrolling container that animates items when they are inserted or removed.',
        route: RoutePaths.animatedListState),
    ListViewItem(
      title: 'AnimatedModalBarrier',
      description:
          'A widget that prevents the user from interacting with widgets behind itself.',
      route: RoutePaths.animatedModalBarrier,
    ),
    ListViewItem(
      title: 'AnimatedOpacity',
      description:
          'Animated version of Opacity which automatically transitions the child\'s opacity over a given duration whenever the given opacity changes.',
      route: RoutePaths.animatedOpacity,
    ),
    ListViewItem(
      title: 'AnimatedPhysicalModel',
      description: 'Animated version of PhysicalModel.',
      route: RoutePaths.animatedPhysicalModel,
    ),
    ListViewItem(
      title: 'AnimatedPositioned',
      description:
          'Animated version of Positioned which automatically transitions the child\'s position over a given duration whenever the given position changes.',
      route: RoutePaths.animatedPositioned,
    ),
    ListViewItem(
        title: 'AnimatedSize',
        description:
            'Animated widget that automatically transitions its size over a given duration whenever the given child\'s size changes.',
        route: RoutePaths.animatedSize),
    ListViewItem(
        title: 'AnimatedWidget',
        description:
            'A widget that rebuilds when the given Listenable changes value.',
        route: RoutePaths.animatedWidget),
    ListViewItem(
      title: 'AnimatedWidgetBaseState',
      description: 'A base class for widgets with implicit animations.',
      route: RoutePaths.animatedWidgetBaseState,
    ),
    ListViewItem(
      title: 'DecoratedBoxTransition',
      description:
          'Animated version of a DecoratedBox that animates the different properties of its Decoration.',
      route: RoutePaths.decoratedBoxTransition,
    ),
    ListViewItem(
      title: 'FadeTransition',
      description: 'Animates the opacity of a widget.',
      route: RoutePaths.fadeTransition,
    ),
    ListViewItem(
      title: 'Hero',
      description:
          'A widget that marks its child as being a candidate for hero animations.',
      route: RoutePaths.hero,
    ),
    ListViewItem(
        title: 'PositionedTransition',
        description:
            'Animated version of Positioned which takes a specific Animation to transition the child\'s position from a start position to and end position over the lifetime of the animation.',
        route: RoutePaths.positionedTransition),
    ListViewItem(
      title: 'RotationTransition',
      description: 'Animates the rotation of a widget.',
      route: RoutePaths.rotationTransition,
    ),
    ListViewItem(
      title: 'ScaleTransition',
      description: 'Animates the scale of transformed widget.',
      route: RoutePaths.scaleTransition,
    ),
    ListViewItem(
      title: 'SizeTransition',
      description: 'Animates its own size and clips and aligns the child.',
      route: RoutePaths.sizeTransition,
    ),
    ListViewItem(
      title: 'SlideTransition',
      description:
          'Animates the position of a widget relative to its normal position.',
      route: RoutePaths.slideTransition,
    ),
  ];

  final String _appBarTitle = 'Animation widgets';

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
