import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../core/router/routes.dart';
import '../../../components/links.dart';

class MaterialWidgetsView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
      title: 'AppBar',
      description:
          'A Material Design app bar. An app bar consists of a toolbar and potentially other widgets, such as a TabBar and a FlexibleSpaceBar.',
      route: RoutePaths.appBar,
    ),
    LinkItem(
      title: 'BottomNavigationBar',
      description:
          'Bottom navigation bars make it easy to explore and switch between top-level views in a single tap. The BottomNavigationBar widget implements this component.',
      route: RoutePaths.bottomNavigationBar,
    ),
    LinkItem(
      title: 'Drawer',
      description:
          'A Material Design panel that slides in horizontally from the edge of a Scaffold to show navigation links in an application.',
      route: RoutePaths.drawer,
    ),
    LinkItem(
        title: 'MaterialApp',
        description:
            'A convenience widget that wraps a number of widgets that are commonly required for applications implementing Material Design.',
        route: RoutePaths.materialApp),
    LinkItem(
      title: 'Scaffold',
      description:
          'Implements the basic Material Design visual layout structure. This class provides APIs for showing drawers, snack bars, and bottom sheets.',
      route: RoutePaths.scaffold,
    ),
    LinkItem(
      title: 'SliverAppBar',
      description:
          'A material design app bar that integrates with a CustomScrollView.',
      route: RoutePaths.sliverAppBar,
    ),
    LinkItem(
      title: 'TabBar',
      description:
          'A Material Design widget that displays a horizontal row of tabs.',
      route: RoutePaths.tabBar,
    ),
    LinkItem(
      title: 'TabBarView',
      description:
          'A page view that displays the widget which corresponds to the currently selected tab. Typically used in conjunction with a TabBar.',
      route: RoutePaths.tabBarView,
    ),
    LinkItem(
      title: 'TabPageSelector',
      description:
          'Displays a row of small circular indicators, one per tab. The selected tab\'s indicator is highlighted. Often used in conjunction with a TabBarView.',
      route: RoutePaths.tabPageSelector,
    ),
    LinkItem(
      title: 'WidgetsApp',
      description:
          'A convenience class that wraps a number of widgets that are commonly required for an application.',
      route: RoutePaths.widgetsApp,
    ),
    LinkItem(
      title: 'DropdownButton',
      description:
          'Shows the currently selected item and an arrow that opens a menu for selecting another item.',
      route: RoutePaths.dropdownButton,
    ),
    LinkItem(
      title: 'ElevatedButton',
      description:
          'A Material Design elevated button. A filled button whose material elevates when pressed.',
      route: RoutePaths.elevatedButton,
    ),
    LinkItem(
      title: 'FloatingActionButton',
      description:
          'A floating action button is a circular icon button that hovers over content to promote a primary action in the application. Floating action buttons are most commonly used in the Scaffold.floatingActionButton field.',
      route: RoutePaths.floatingActionButton,
    ),
    LinkItem(
      title: 'IconButton',
      description:
          'An icon button is a picture printed on a Material widget that reacts to touches by filling with color (ink).',
      route: RoutePaths.iconButton,
    ),
    LinkItem(
      title: 'OutlinedButton',
      description:
          'A Material Design outlined button, essentially a TextButton with an outlined border.',
      route: RoutePaths.outlineButton,
    ),
    LinkItem(
      title: 'PopupMenuButton',
      description:
          'Displays a menu when pressed and calls onSelected when the menu is dismissed because an item was selected.',
      route: RoutePaths.popupMenuButton,
    ),
    LinkItem(
      title: 'TextButton',
      description:
          'A Material Design text button. A simple flat button without a border outline.',
      route: RoutePaths.textButton,
    ),
    LinkItem(
      title: 'Checkbox',
      description:
          'Checkboxes allow the user to select multiple options from a set. The Checkbox widget implements this component.',
      route: RoutePaths.checkBox,
    ),
    LinkItem(
      title: 'showDatePicker',
      description:
          'Date pickers use a dialog window to select a single date on mobile. Time pickers use a dialog to select a single time (in the hours:minutes format) on mobile.',
      route: RoutePaths.showDatePicker,
    ),
    LinkItem(
      title: 'Radio',
      description:
          'Radio buttons allow the user to select one option from a set. Use radio buttons for exclusive selection if you think that the user needs to see all available options side-by-side.',
      route: RoutePaths.radio,
    ),
    LinkItem(
      title: 'Slider',
      description:
          'Sliders let users select from a range of values by moving the slider thumb.',
      route: RoutePaths.slider,
    ),
    LinkItem(
      title: 'Switch',
      description:
          'On/off switches toggle the state of a single settings option. The Switch widget implements this component.',
      route: RoutePaths.switchMaterial,
    ),
    LinkItem(
      title: 'TextField',
      description:
          'Touching a text field places the cursor and displays the keyboard. The TextField widget implements this component.',
      route: RoutePaths.textField,
    ),
    LinkItem(
        title: 'AlertDialog',
        description:
            'Alerts are urgent interruptions requiring acknowledgement that inform the user about a situation. The AlertDialog widget implements this component.',
        route: RoutePaths.alertDialog),
    LinkItem(
      title: 'BottomSheet',
      description:
          'Bottom sheets slide up from the bottom of the screen to reveal more content. You can call showBottomSheet() to implement a persistent bottom sheet or showModalBottomSheet() to implement a modal bottom sheet.',
      route: RoutePaths.bottomSheet,
    ),
    LinkItem(
      title: 'ExpansionPanel',
      description:
          'Expansion panels contain creation flows and allow lightweight editing of an element. The ExpansionPanel widget implements this component.',
      route: RoutePaths.expansionPanel,
    ),
    LinkItem(
      title: 'SimpleDialog',
      description:
          'Simple dialogs can provide additional details or actions about a list item. For example they can display avatars icons clarifying subtext or orthogonal actions (such as adding an account).',
      route: RoutePaths.simpleDialog,
    ),
    LinkItem(
        title: 'SnackBar',
        description:
            'A lightweight message with an optional action which briefly displays at the bottom of the screen.',
        route: RoutePaths.snackBar),
    LinkItem(
      title: 'Card',
      description:
          'A Material Design card. A card has slightly rounded corners and a shadow.',
      route: RoutePaths.card,
    ),
    LinkItem(
      title: 'Chip',
      description:
          'A Material Design chip. Chips represent complex entities in small blocks, such as a contact.',
      route: RoutePaths.chip,
    ),
    LinkItem(
        title: 'CircularProgressIndicator',
        description:
            'A material design circular progress indicator, which spins to indicate that the application is busy.',
        route: RoutePaths.circularProgressIndicator),
    LinkItem(
      title: 'DataTable',
      description:
          'Data tables display sets of raw data. They usually appear in desktop enterprise products. The DataTable widget implements this component.',
      route: RoutePaths.dataTable,
    ),
    LinkItem(
      title: 'GridView',
      description:
          'A grid list consists of a repeated pattern of cells arrayed in a vertical and horizontal layout. The GridView widget implements this component.',
      route: RoutePaths.gridView,
    ),
    LinkItem(
      title: 'Icon',
      description: 'A Material Design icon.',
      route: RoutePaths.icon,
    ),
    LinkItem(
      title: 'Image',
      description: 'A widget that displays an image.',
      route: RoutePaths.image,
    ),
    LinkItem(
      title: 'LinearProgressIndicator',
      description:
          'A material design linear progress indicator, also known as a progress bar.',
      route: RoutePaths.linearProgressIndicator,
    ),
    LinkItem(
      title: 'Tooltip',
      description:
          'Tooltips provide text labels that help explain the function of a button or other user interface action. Wrap the button in a Tooltip widget to show a label when the widget long pressed (or when the user takes some other appropriate action).',
      route: RoutePaths.tooltip,
    ),
    LinkItem(
      title: 'Divider',
      description:
          'A one logical pixel thick horizontal line, with padding on either side.',
      route: RoutePaths.divider,
    ),
    LinkItem(
      title: 'ListTile',
      description:
          'A single fixed-height row that typically contains some text as well as a leading or trailing icon.',
      route: RoutePaths.listTile,
    ),
    LinkItem(
      title: 'Stepper',
      description:
          'A Material Design stepper widget that displays progress through a sequence of steps.',
      route: RoutePaths.stepper,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Material widgets",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
