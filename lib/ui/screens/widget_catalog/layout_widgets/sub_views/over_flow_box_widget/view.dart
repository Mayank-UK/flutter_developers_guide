import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class OverFlowBoxWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'OverFlowBox',
      markdownPath: 'assets/markdowns/widget_catalog/layout/overflow_box_markdown.md',
      preview: _OverFlowBoxWidgetImplementation(),
    );
  }
}

class _OverFlowBoxWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'OverflowBox imposes constraints on its child that differ from the ones it receives from its parent. By giving it minWidth/maxWidth/minHeight/maxHeight you can let the child be larger (or smaller) than the parent would otherwise allow, so the child visibly overflows the parent\'s box without the parent being resized.',
            ),
            TextBlock(
              'Use it for deliberate visual overflow effects (a badge that pokes out of a card, an icon that spills past a clipped frame). The overflow is not clipped for you — pair it with a ClipRect if you actually want the overflowing pixels to be cut off.',
            ),
            Container(
              color: Colors.amber,
              height: 50,
              child: OverflowBox(
                maxWidth: 200,
                maxHeight: 200,
                child: Container(
                  color: Colors.red,
                  height: 100,
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
