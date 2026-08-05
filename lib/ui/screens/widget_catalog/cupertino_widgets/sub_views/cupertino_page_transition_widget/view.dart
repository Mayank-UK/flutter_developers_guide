import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoPageTransitionWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'CupertinoPageTransition',
      markdownPath: 'assets/markdowns/widget_catalog/cupertino/cupertino_page_transition_markdown.md',
      preview: _CupertinoPageTransitionWidgetImplementation(),
    );
  }
}

class _CupertinoPageTransitionWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoPageTransition is the standard iOS-style horizontal slide-and-fade used when pushing and popping pages: the incoming page slides in from the right while the previous page parallax-slides toward the left edge.',
            ),
            TextBlock(
              'You normally never use it directly — CupertinoPageRoute applies it automatically. It is exposed so that a custom PageRoute can reuse the exact system transition, or so a CupertinoAppBar can drive the active-state gestures that match it.',
            ),
          ],
        ),
      ],
    );
  }
}
