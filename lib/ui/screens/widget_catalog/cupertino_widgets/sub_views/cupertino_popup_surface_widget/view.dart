import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoPopupSurfaceWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'CupertinoPopupSurfaceWidgetView',
      markdownPath: 'assets/markdowns/widget_catalog/cupertino/cupertino_popup_surface_markdown.md',
      preview: _CupertinoPopupSurfaceWidgetImplementation(),
    );
  }
}

class _CupertinoPopupSurfaceWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoPopupSurface is the rounded-rectangle background that gives iOS popups (dialogs, action sheets) their signature look — a soft-cornered white card with a subtle shadow. It paints the chrome and hosts your content as its child.',
            ),
            TextBlock(
              'Most apps never use it directly: CupertinoAlertDialog and CupertinoActionSheet compose it for you. Reach for CupertinoPopupSurface only when you are building a fully custom popup that should still feel native iOS.',
            ),
          ],
        ),
      ],
    );
  }
}
