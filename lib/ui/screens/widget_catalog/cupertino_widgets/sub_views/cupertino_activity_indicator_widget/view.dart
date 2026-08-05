import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoActivityIndicatorWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'CupertinoAcivityIndicator',
      markdownPath: 'assets/markdowns/widget_catalog/cupertino/cupertino_activity_indicator_markdown.md',
      preview: _CupertinoActivityIndicatorWidgetImplementation(),
    );
  }
}

class _CupertinoActivityIndicatorWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoActivityIndicator is the iOS-style spinner: a circle of radiating ticks that rotates continuously. It\'s the platform-idiomatic busy indicator, used wherever a Material CircularProgressIndicator would feel out of place.',
            ),
            TextBlock(
              'Set animating: false to keep it on screen but frozen (a "paused" state) without removing it from the tree. For apps that adapt per platform, the Adaptive indicator helper switches between this and the Material spinner automatically.',
            ),
          ],
        ),
      ],
    );
  }
}
