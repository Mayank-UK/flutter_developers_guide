import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoTabViewWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'CupertinoTabView',
      markdownPath: 'assets/markdowns/widget_catalog/cupertino/cupertino_tab_view_markdown.md',
      preview: _CupertinoTabViewWidgetImplementation(),
    );
  }
}

class _CupertinoTabViewWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoTabView is the root of a single tab\'s content, holding its own Navigator so each tab maintains an independent navigation stack. Use it as the builder result inside CupertinoTabScaffold\'s tabBuilder.',
            ),
            TextBlock(
              'Its parallel navigators are exactly what lets each tab preserve its own back-stack as the user switches between them — a defining iOS behavior. Set routes or onGenerateRoute to seed the tab with its initial page and named routes.',
            ),
          ],
        ),
      ],
    );
  }
}
