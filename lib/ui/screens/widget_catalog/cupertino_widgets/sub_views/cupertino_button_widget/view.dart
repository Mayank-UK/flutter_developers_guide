import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoButtonWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'CupertinoButton',
      markdownPath: 'assets/markdowns/widget_catalog/cupertino/cupertino_button_markdown.md',
      preview: _CupertinoButtonWidgetImplementation(),
    );
  }
}

class _CupertinoButtonWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoButton is the iOS-style button. By default it has no background and signals taps by lowering its opacity (dimming) rather than the Material ripple — the signature iOS press feedback. Pass color: and borderRadius: for the common filled pill-shaped button.',
            ),
            TextBlock(
              'It sizes to its child plus padding; pass minSize: 44 to honor the iOS tap-target guideline. For a button that should blend into either platform, use the Adaptive helper or ElevatedButton/TextButton when you want Material behavior.',
            ),
          ],
        ),
      ],
    );
  }
}
