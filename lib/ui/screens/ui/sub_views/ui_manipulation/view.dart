import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/links.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../navigation/routes.dart';

class UiManipulationView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
        title: 'Layout',
        description: 'Building the page structure.',
        route: RoutePaths.layout),
    Link(
        title: 'Dimensions and constraints',
        description: 'Setting height, widths and constraints on widgets.',
        route: RoutePaths.dimensionsConstraints),
    Link(
        title: 'Spacing',
        description: 'Margin and padding on widgets.',
        route: RoutePaths.spacing),
    Link(
        title: 'Colors and backgrounds',
        description: 'Text and background colors.',
        route: RoutePaths.colorsBackgrounds),
    Link(
        title: 'Text',
        description: 'Using and manipulating text in UI.',
        route: RoutePaths.textManipulation),
    Link(
        title: 'Alignment',
        description: 'Specifying the alignment on widgets.',
        route: RoutePaths.alignment),
    Link(
        title: 'Borders',
        description: 'Setting and modifying borders.',
        route: RoutePaths.borders),
    Link(
        title: 'Icons and images',
        description: 'Using icons and images in layout.',
        route: RoutePaths.iconsImages),
    Link(
        title: 'Effects',
        description: 'Things like shadows, opacity, etc',
        route: RoutePaths.effects),
    Link(
        title: 'Positioning',
        description: 'Positioning UI elements in layout.',
        route: RoutePaths.positioning),
    Link(
        title: 'Visibility',
        description: 'Make a UI element visible, transparent, or invisible.',
        route: RoutePaths.visibility),
    Link(
        title: 'Theme',
        description: 'Define the styles one time and at one place.',
        route: RoutePaths.themeManipulation),
    Link(
        title: 'Interactive behaviors',
        description: 'Interaction to click, hover, focus, etc',
        route: RoutePaths.interactiveBehavior),
    Link(
        title: 'Web & apps',
        description: 'Navigating to a resource location on web.',
        route: RoutePaths.webAndApps),
    Link(
        title: 'Form',
        description: 'Mechanism to take user input.',
        route: RoutePaths.form),
    Link(
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
