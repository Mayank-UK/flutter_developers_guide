import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoScaffoldWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'CupertinoScaffold',
      markdownPath: 'assets/markdowns/widget_catalog/cupertino/cupertino_scaffold_markdown.md',
      preview: _CupertinoScaffoldWidgetImplementation(),
    );
  }
}

class _CupertinoScaffoldWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoPageScaffold is the iOS-style page layout: it positions a CupertinoNavigationBar above a content area, all painted on a background color. It is the Cupertino counterpart of the Material Scaffold.',
            ),
            TextBlock(
              'Set navigationBar (a CupertinoNavigationBar) and child (your page content). It handles the safe-area insets and the navigation bar\'s height for you; for tabbed apps compose it inside a CupertinoTabScaffold instead of nesting your own bottom bar.',
            ),
          ],
        ),
      ],
    );
  }
}
