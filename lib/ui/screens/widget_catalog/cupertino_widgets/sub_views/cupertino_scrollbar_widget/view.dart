import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoScrollbarWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'CupertinoScrollBar',
      markdownPath: 'assets/markdowns/widget_catalog/cupertino/cupertino_scrollbar_markdown.md',
      preview: _CupertinoScrollbarWidgetImplementation(),
    );
  }
}

class _CupertinoScrollbarWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoScrollbar is the iOS-style scrollbar: a thin thumb that fades in while the user scrolls and fades out shortly after. Wrap a scrollable to show it; it indicates which slice of the content is currently visible.',
            ),
            TextBlock(
              'Unlike the Material Scrollbar it has no hover-track and no interactive drag by default. Pass the same ScrollController to both the scrollbar and the scrollable so the thumb reflects the correct extent and position.',
            ),
          ],
        ),
      ],
    );
  }
}
