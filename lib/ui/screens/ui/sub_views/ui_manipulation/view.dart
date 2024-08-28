import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/links.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../navigation/routes.dart';

class UiManipulationView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
        title: 'Layout',
        description: 'Building the page structure.',
        route: RoutePaths.layout),
    LinkItem(
        title: 'Dimensions and constraints',
        description: 'Setting height, widths and constraints on widgets.',
        route: RoutePaths.dimensionsConstraints),
    LinkItem(
        title: 'Spacing',
        description: 'Margin and padding on widgets.',
        route: RoutePaths.spacing),
    LinkItem(
        title: 'Colors and backgrounds',
        description: 'Text and background colors.',
        route: RoutePaths.colorsBackgrounds),
    LinkItem(
        title: 'Text',
        description: 'Using and manipulating text in UI.',
        route: RoutePaths.textManipulation),
    LinkItem(
        title: 'Alignment',
        description: 'Specifying the alignment on widgets.',
        route: RoutePaths.alignment),
    LinkItem(
        title: 'Borders',
        description: 'Setting and modifying borders.',
        route: RoutePaths.borders),
    LinkItem(
        title: 'Icons and images',
        description: 'Using icons and images in layout.',
        route: RoutePaths.iconsImages),
    LinkItem(
        title: 'Effects',
        description: 'Things like shadows, opacity, etc',
        route: RoutePaths.effects),
    LinkItem(
        title: 'Positioning',
        description: 'Positioning UI elements in layout.',
        route: RoutePaths.positioning),
    LinkItem(
        title: 'Visibility',
        description: 'Make a UI element visible, transparent, or invisible.',
        route: RoutePaths.visibility),
    LinkItem(
        title: 'Theme',
        description: 'Define the styles one time and at one place.',
        route: RoutePaths.themeManipulation),
    LinkItem(
        title: 'Interactive behaviors',
        description: 'Interaction to click, hover, focus, etc',
        route: RoutePaths.interactiveBehavior),
    LinkItem(
        title: 'Web & apps',
        description: 'Navigating to a resource location on web.',
        route: RoutePaths.webAndApps),
    LinkItem(
        title: 'Form',
        description: 'Mechanism to take user input.',
        route: RoutePaths.form),
    LinkItem(
        title: 'Media',
        description: 'Dealing with media like video, audio, etc.',
        route: RoutePaths.media),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "UI manipulation",
      children: [
        Links(
          itemList: this._itemList,
        ),
      ],
    );
  }
}
