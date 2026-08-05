import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoNavigationBarWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'CupertinoNavigationBar',
      markdownPath: 'assets/markdowns/widget_catalog/cupertino/cupertino_navigation_bar_markdown.md',
      preview: _CupertinoNavigationBarWidgetImplementation(),
    );
  }
}

class _CupertinoNavigationBarWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoNavigationBar is the iOS-style top bar: a back chevron on the left, a centered title, and optional leading/trailing widgets. Place it as the navigationBar of a CupertinoPageScaffold.',
            ),
            TextBlock(
              'The back button appears automatically when there is a previous route on the stack; set automaticallyImplyLeading: false to suppress it. For the iOS 11 large-title behavior that expands and collapses with scroll, use the sliver variant CupertinoSliverNavigationBar instead.',
            ),
          ],
        ),
      ],
    );
  }
}
