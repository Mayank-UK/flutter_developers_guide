import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';

import '../../../../core/router/routes.dart';
import '../../../components/list.dart';
import '../../../components/main_appbar.dart';

class CupertinoWidgetsView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
      title: 'CupertinoActionSheet',
      description:
          'An iOS-style modal bottom action sheet to choose an option among many.',
      route: RoutePaths.cupertinoActionSheet,
    ),
    ListViewItem(
      title: 'CupertinoActivityIndicator',
      description:
          'An iOS-style activity indicator. Displays a circular \'spinner\'.',
      route: RoutePaths.cupertinoActivityIndicator,
    ),
    ListViewItem(
      title: 'CupertinoAlertDialog',
      description: 'An iOS-style alert dialog.',
      route: RoutePaths.cupertinoAlertDialog,
    ),
    ListViewItem(
      title: 'CupertinoButton',
      description: 'An iOS-style button.',
      route: RoutePaths.cupertinoButton,
    ),
    ListViewItem(
      title: 'CupertinoContextMenu',
      description:
          'An iOS-style full-screen modal route that opens when the child is long-pressed. Used to display relevant actions for your content.',
      route: RoutePaths.cupertinoContextMenu,
    ),
    ListViewItem(
      title: 'CupertinoDatePicker',
      description: 'An iOS-style date or date and time picker.',
      route: RoutePaths.cupertinoDatePicker,
    ),
    ListViewItem(
      title: 'CupertinoDialog',
      description: 'An iOS-style dialog.',
      route: RoutePaths.cupertinoDialog,
    ),
    ListViewItem(
      title: 'CupertinoDialogAction',
      description: 'A button typically used in a CupertinoAlertDialog.',
      route: RoutePaths.cupertinoDialogAction,
    ),
    ListViewItem(
      title: 'CupertinoFullscreenDialogTransition',
      description:
          'An iOS-style transition used for summoning fullscreen dialogs.',
      route: RoutePaths.cupertinoFullScreenDialogTransition,
    ),
    ListViewItem(
      title: 'CupertinoNavigationBar',
      description:
          'An iOS-style top navigation bar. Typically used with CupertinoPageScaffold.',
      route: RoutePaths.cupertinoNavigationBar,
    ),
    ListViewItem(
      title: 'CupertinoScaffold',
      description:
          'Basic iOS style page layout structure. Positions a navigation bar and content on a background.',
      route: RoutePaths.cupertinoScaffold,
    ),
    ListViewItem(
      title: 'CupertinoPageTransition',
      description: 'Provides an iOS-style page transition animation.',
      route: RoutePaths.cupertinoPageTransition,
    ),
    ListViewItem(
      title: 'CupertinoPicker',
      description:
          'An iOS-style picker control. Used to select an item in a short list.',
      route: RoutePaths.cupertinoPicker,
    ),
    ListViewItem(
      title: 'CupertinoPopupSurface',
      description:
          'Rounded rectangle surface that looks like an iOS popup surface, such as an alert dialog or action sheet.',
      route: RoutePaths.cupertinoPopupSurface,
    ),
    ListViewItem(
        title: 'CupertinoScrollbar',
        description:
            'An iOS-style scrollbar that indicates which portion of a scrollable widget is currently visible.',
        route: RoutePaths.cupertinoScrollbar),
    ListViewItem(
      title: 'CupertinoSearchField',
      description: 'An iOS-style search field.',
      route: RoutePaths.cupertinoSearchField,
    ),
    ListViewItem(
      title: 'CupertinoSegmentedControl',
      description:
          'An iOS-style segmented control. Used to select mutually exclusive options in a horizontal list.',
      route: RoutePaths.cupertinoSegmentedControl,
    ),
    ListViewItem(
      title: 'CupertinoSlider',
      description: 'Used to select from a range of values.',
      route: RoutePaths.cupertinoSlider,
    ),
    ListViewItem(
        title: 'CupertinoSlidingSegmentedControl',
        description:
            'An iOS-13-style segmented control. Used to select mutually exclusive options in a horizontal list.',
        route: RoutePaths.cupertinoSlidingSegmentedControl),
    ListViewItem(
      title: 'CupertinoSliverNavigationBar',
      description:
          'An iOS-styled navigation bar with iOS-11-style large titles using slivers.',
      route: RoutePaths.cupertinoSliverNavigationBar,
    ),
    ListViewItem(
      title: 'CupertinoSwitch',
      description:
          'An iOS-style switch. Used to toggle the on/off state of a single setting.',
      route: RoutePaths.cupertinoSwitch,
    ),
    ListViewItem(
      title: 'CupertinoTabBar',
      description:
          'An iOS-style bottom tab bar. Typically used with CupertinoTabScaffold.',
      route: RoutePaths.cupertinoTabBar,
    ),
    ListViewItem(
      title: 'CupertinoTabScaffold',
      description:
          'Tabbed iOS app structure. Positions a tab bar on top of tabs of content.',
      route: RoutePaths.cupertinoTabScaffold,
    ),
    ListViewItem(
      title: 'CupertinoTabView',
      description:
          'Root content of a tab that supports parallel navigation between tabs. Typically used with CupertinoTabScaffold.',
      route: RoutePaths.cupertinoTabView,
    ),
    ListViewItem(
      title: 'CupertinoTextField',
      description: 'An iOS-style text field.',
      route: RoutePaths.cupertinoTextField,
    ),
    ListViewItem(
      title: 'CupertinoTimePicker',
      description: 'An iOS-style countdown timer picker.',
      route: RoutePaths.cupertinoTimePicker,
    ),
  ];

  final String _appBarTitle = 'Cupertino widgets';

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
