import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class StackWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Stack',
      markdownPath: 'assets/markdowns/widget_catalog/layout/stack_markdown.md',
      preview: _StackWidgetImplementation(),
    );
  }
}

class _StackWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Stack paints its children on top of one another in a single box, in the order they appear in the children list (later children are drawn above earlier ones). It is the widget for overlapping layouts — an image with a gradient overlay, a card with a badge, a button floating over a hero image.',
            ),
            TextBlock(
              'Two positioning modes: non-positioned children are aligned together according to alignment (topStart by default, often you want center), while Positioned children are pinned to specific edges or coordinates of the stack. Use Positioned inside a Stack with a known bounded size; for percentage-based pinning use Positioned.fill or fractional Align.',
            ),
            TextBlock(
              'Gotcha: Stack sizes itself to its largest non-positioned child (or to the constraints from the parent if there are no non-positioned children). If you wrap every child in Positioned the Stack has no natural size and will fill the parent — which is usually what you want for a full-bleed overlay.',
            ),
            Container(
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      color: Colors.amber,
                      height: 300,
                      width: 300,
                    ),
                  ),
                  Positioned(
                    child: Container(
                      color: Colors.red,
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Positioned(
                    child: Container(
                      color: Colors.blue,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
