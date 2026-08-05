import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoFullScreenDialogTransitionWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'CupertinoFullScreenDialogTransition',
      markdownPath: 'assets/markdowns/widget_catalog/cupertino/cupertino_fullscreen_dialog_transition_markdown.md',
      preview: _CupertinoFullScreenDialogTransitionWidgetImplementation(),
    );
  }
}

class _CupertinoFullScreenDialogTransitionWidgetImplementation
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoFullscreenDialogTransition is the iOS-style vertical slide-up transition applied to full-screen modal pages (think "Compose new email"). It fades the incoming page in while sliding it up from the bottom.',
            ),
            TextBlock(
              'You rarely instantiate it. CupertinoPageRoute applies it automatically when fullscreenDialog: true is set on the route; reach for the widget directly only when building a fully custom route that needs to mimic the system transition.',
            ),
          ],
        ),
      ],
    );
  }
}
