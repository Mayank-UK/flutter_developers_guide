import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../core/router/routes.dart';
import '../../../components/links.dart';

class CupertinoWidgetsView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
      title: 'CupertinoActionSheet',
      description:
          'An iOS-style modal bottom action sheet to choose an option among many.',
      route: RoutePaths.cupertinoActionSheet,
    ),
    LinkItem(
      title: 'CupertinoActivityIndicator',
      description:
          'An iOS-style activity indicator. Displays a circular \'spinner\'.',
      route: RoutePaths.cupertinoActivityIndicator,
    ),
    LinkItem(
      title: 'CupertinoAlertDialog',
      description: 'An iOS-style alert dialog.',
      route: RoutePaths.cupertinoAlertDialog,
    ),
    LinkItem(
      title: 'CupertinoButton',
      description: 'An iOS-style button.',
      route: RoutePaths.cupertinoButton,
    ),
    LinkItem(
      title: 'CupertinoContextMenu',
      description:
          'An iOS-style full-screen modal route that opens when the child is long-pressed. Used to display relevant actions for your content.',
      route: RoutePaths.cupertinoContextMenu,
    ),
    LinkItem(
      title: 'CupertinoDatePicker',
      description: 'An iOS-style date or date and time picker.',
      route: RoutePaths.cupertinoDatePicker,
    ),
    LinkItem(
      title: 'CupertinoDialog',
      description: 'An iOS-style dialog.',
      route: RoutePaths.cupertinoDialog,
    ),
    LinkItem(
      title: 'CupertinoDialogAction',
      description: 'A button typically used in a CupertinoAlertDialog.',
      route: RoutePaths.cupertinoDialogAction,
    ),
    LinkItem(
      title: 'CupertinoFullscreenDialogTransition',
      description:
          'An iOS-style transition used for summoning fullscreen dialogs.',
      route: RoutePaths.cupertinoFullScreenDialogTransition,
    ),
    LinkItem(
      title: 'CupertinoNavigationBar',
      description:
          'An iOS-style top navigation bar. Typically used with CupertinoPageScaffold.',
      route: RoutePaths.cupertinoNavigationBar,
    ),
    LinkItem(
      title: 'CupertinoScaffold',
      description:
          'Basic iOS style page layout structure. Positions a navigation bar and content on a background.',
      route: RoutePaths.cupertinoScaffold,
    ),
    LinkItem(
      title: 'CupertinoPageTransition',
      description: 'Provides an iOS-style page transition animation.',
      route: RoutePaths.cupertinoPageTransition,
    ),
    LinkItem(
      title: 'CupertinoPicker',
      description:
          'An iOS-style picker control. Used to select an item in a short list.',
      route: RoutePaths.cupertinoPicker,
    ),
    LinkItem(
      title: 'CupertinoPopupSurface',
      description:
          'Rounded rectangle surface that looks like an iOS popup surface, such as an alert dialog or action sheet.',
      route: RoutePaths.cupertinoPopupSurface,
    ),
    LinkItem(
        title: 'CupertinoScrollbar',
        description:
            'An iOS-style scrollbar that indicates which portion of a scrollable widget is currently visible.',
        route: RoutePaths.cupertinoScrollbar),
    LinkItem(
      title: 'CupertinoSearchField',
      description: 'An iOS-style search field.',
      route: RoutePaths.cupertinoSearchField,
    ),
    LinkItem(
      title: 'CupertinoSegmentedControl',
      description:
          'An iOS-style segmented control. Used to select mutually exclusive options in a horizontal list.',
      route: RoutePaths.cupertinoSegmentedControl,
    ),
    LinkItem(
      title: 'CupertinoSlider',
      description: 'Used to select from a range of values.',
      route: RoutePaths.cupertinoSlider,
    ),
    LinkItem(
        title: 'CupertinoSlidingSegmentedControl',
        description:
            'An iOS-13-style segmented control. Used to select mutually exclusive options in a horizontal list.',
        route: RoutePaths.cupertinoSlidingSegmentedControl),
    LinkItem(
      title: 'CupertinoSliverNavigationBar',
      description:
          'An iOS-styled navigation bar with iOS-11-style large titles using slivers.',
      route: RoutePaths.cupertinoSliverNavigationBar,
    ),
    LinkItem(
      title: 'CupertinoSwitch',
      description:
          'An iOS-style switch. Used to toggle the on/off state of a single setting.',
      route: RoutePaths.cupertinoSwitch,
    ),
    LinkItem(
      title: 'CupertinoTabBar',
      description:
          'An iOS-style bottom tab bar. Typically used with CupertinoTabScaffold.',
      route: RoutePaths.cupertinoTabBar,
    ),
    LinkItem(
      title: 'CupertinoTabScaffold',
      description:
          'Tabbed iOS app structure. Positions a tab bar on top of tabs of content.',
      route: RoutePaths.cupertinoTabScaffold,
    ),
    LinkItem(
      title: 'CupertinoTabView',
      description:
          'Root content of a tab that supports parallel navigation between tabs. Typically used with CupertinoTabScaffold.',
      route: RoutePaths.cupertinoTabView,
    ),
    LinkItem(
      title: 'CupertinoTextField',
      description: 'An iOS-style text field.',
      route: RoutePaths.cupertinoTextField,
    ),
    LinkItem(
      title: 'CupertinoTimePicker',
      description: 'An iOS-style countdown timer picker.',
      route: RoutePaths.cupertinoTimePicker,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Cupertino widgets",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
