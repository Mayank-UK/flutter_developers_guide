import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../navigation/routes.dart';
import '../../../components/links.dart';

class CupertinoWidgetsView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'CupertinoActionSheet',
      description:
          'An iOS-style modal bottom action sheet to choose an option among many.',
      route: RoutePaths.cupertinoActionSheet,
    ),
    Link(
      title: 'CupertinoActivityIndicator',
      description:
          'An iOS-style activity indicator — a rotating circle of radiating ticks. Use it instead of CircularProgressIndicator when matching iOS; set animating: false to freeze it without unmounting.',
      route: RoutePaths.cupertinoActivityIndicator,
    ),
    Link(
      title: 'CupertinoAlertDialog',
      description:
          'An iOS-style centered alert with title, content, and a row of CupertinoDialogAction buttons. Shown via showCupertinoDialog; mark the primary choice isDefaultAction and destructive ones isDestructiveAction.',
      route: RoutePaths.cupertinoAlertDialog,
    ),
    Link(
      title: 'CupertinoButton',
      description:
          'An iOS-style button. By default borderless with opacity-dim press feedback (no Material ripple); pass color: and borderRadius: for the common filled pill shape.',
      route: RoutePaths.cupertinoButton,
    ),
    Link(
      title: 'CupertinoContextMenu',
      description:
          'An iOS-style full-screen modal route that opens when the child is long-pressed. Used to display relevant actions for your content.',
      route: RoutePaths.cupertinoContextMenu,
    ),
    Link(
      title: 'CupertinoDatePicker',
      description: 'An iOS-style date or date and time picker.',
      route: RoutePaths.cupertinoDatePicker,
    ),
    Link(
      title: 'CupertinoDialog',
      description: 'An iOS-style dialog.',
      route: RoutePaths.cupertinoDialog,
    ),
    Link(
      title: 'CupertinoDialogAction',
      description:
          'A button used inside a CupertinoAlertDialog. Carry a text label and an onPressed; isDefaultAction bolds the recommended choice and isDestructiveAction renders it red.',
      route: RoutePaths.cupertinoDialogAction,
    ),
    Link(
      title: 'CupertinoFullscreenDialogTransition',
      description:
          'An iOS-style transition used for summoning fullscreen dialogs.',
      route: RoutePaths.cupertinoFullScreenDialogTransition,
    ),
    Link(
      title: 'CupertinoNavigationBar',
      description:
          'An iOS-style top navigation bar. Typically used with CupertinoPageScaffold.',
      route: RoutePaths.cupertinoNavigationBar,
    ),
    Link(
      title: 'CupertinoScaffold',
      description:
          'Basic iOS style page layout structure. Positions a navigation bar and content on a background.',
      route: RoutePaths.cupertinoScaffold,
    ),
    Link(
      title: 'CupertinoPageTransition',
      description:
          'The standard iOS horizontal slide-and-fade page transition. CupertinoPageRoute applies it automatically; reach for it directly only when building a custom route that needs to mimic the system transition.',
      route: RoutePaths.cupertinoPageTransition,
    ),
    Link(
      title: 'CupertinoPicker',
      description:
          'An iOS-style picker control. Used to select an item in a short list.',
      route: RoutePaths.cupertinoPicker,
    ),
    Link(
      title: 'CupertinoPopupSurface',
      description:
          'Rounded rectangle surface that looks like an iOS popup surface, such as an alert dialog or action sheet.',
      route: RoutePaths.cupertinoPopupSurface,
    ),
    Link(
        title: 'CupertinoScrollbar',
        description:
            'An iOS-style scrollbar that indicates which portion of a scrollable widget is currently visible.',
        route: RoutePaths.cupertinoScrollbar),
    Link(
      title: 'CupertinoSearchField',
      description:
          'An iOS-style search field — rounded grey background, leading magnifier icon, optional clear button. Drive filtering through onChanged/onSubmitted; pass your own controller to preset the value.',
      route: RoutePaths.cupertinoSearchField,
    ),
    Link(
      title: 'CupertinoSegmentedControl',
      description:
          'An iOS-style segmented control. Used to select mutually exclusive options in a horizontal list.',
      route: RoutePaths.cupertinoSegmentedControl,
    ),
    Link(
      title: 'CupertinoSlider',
      description:
          'The iOS-style slider for selecting from a continuous range. Use onChanged while dragging and onChangeEnd to commit; the thumb springs with the native iOS feel.',
      route: RoutePaths.cupertinoSlider,
    ),
    Link(
        title: 'CupertinoSlidingSegmentedControl',
        description:
            'An iOS-13-style segmented control. Used to select mutually exclusive options in a horizontal list.',
        route: RoutePaths.cupertinoSlidingSegmentedControl),
    Link(
      title: 'CupertinoSliverNavigationBar',
      description:
          'An iOS-styled navigation bar with iOS-11-style large titles using slivers.',
      route: RoutePaths.cupertinoSliverNavigationBar,
    ),
    Link(
      title: 'CupertinoSwitch',
      description:
          'An iOS-style switch. Used to toggle the on/off state of a single setting.',
      route: RoutePaths.cupertinoSwitch,
    ),
    Link(
      title: 'CupertinoTabBar',
      description:
          'An iOS-style bottom tab bar. Typically used with CupertinoTabScaffold.',
      route: RoutePaths.cupertinoTabBar,
    ),
    Link(
      title: 'CupertinoTabScaffold',
      description:
          'Tabbed iOS app structure. Positions a tab bar on top of tabs of content.',
      route: RoutePaths.cupertinoTabScaffold,
    ),
    Link(
      title: 'CupertinoTabView',
      description:
          'Root content of a tab that supports parallel navigation between tabs. Typically used with CupertinoTabScaffold.',
      route: RoutePaths.cupertinoTabView,
    ),
    Link(
      title: 'CupertinoTextField',
      description:
          'An iOS-style single-line text input with a rounded border, system cursor, and optional prefix/suffix widgets. Read via onChanged/onSubmitted or an attached TextEditingController.',
      route: RoutePaths.cupertinoTextField,
    ),
    Link(
      title: 'CupertinoTimePicker',
      description:
          'An iOS-style countdown timer picker — a wheel-based dial for choosing a Duration. Use onTimerDurationChanged to receive the value; distinct from CupertinoDatePicker, which is for clock/calendar times.',
      route: RoutePaths.cupertinoTimePicker,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Cupertino widgets",
      mobileUi: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
