import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ClipRectWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'ClipRect',
      markdownPath: 'assets/markdowns/widget_catalog/painting_effects/clip_r_rect_markdown.md',
      preview: _ClipRectWidgetImplementation(),
    );
  }
}

class _ClipRectWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'ClipRRect crops its child to a rectangle with rounded corners, specified by a BorderRadius. (Its sibling ClipRect crops to a plain sharp-cornered rectangle.) It\'s the standard way to round the corners of an image, video, or any widget that doesn\'t expose a `borderRadius` of its own.',
            ),
            TextBlock(
              'When you\'re rounding a Container\'s own background rather than a child, prefer BoxDecoration.borderRadius over clipping — the decoration is rasterized in one pass, while clipping introduces a separate clip layer. Reach for ClipRRect specifically when the content being rounded is an external image or raster.',
            ),
            Container(
              color: Colors.amber,
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: Colors.red,
                  height: 80,
                  width: 100,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
