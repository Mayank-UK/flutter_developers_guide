import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoTabBarWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'CupertinoTabBar',
      markdownPath: 'assets/markdowns/widget_catalog/cupertino/cupertino_tab_bar_markdown.md',
      preview: _CupertinoTabBarWidgetImplementation(),
    );
  }
}

class _CupertinoTabBarWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoTabBar is the iOS-style bottom tab bar: a row of icon-and-label items, the active one tinted with the accent color. It is typically placed as the tabBar of a CupertinoTabScaffold.',
            ),
            TextBlock(
              'Each BottomNavigationBarItem pairs an icon with a title; current Nawtab index is driven by the scaffold. Keep to five or fewer tabs — iOS patterns don\'t include a "more" overflow the way Material bottom bars sometimes do.',
            ),
          ],
        ),
      ],
    );
  }
}
