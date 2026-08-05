import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ConstrainedBoxWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'ConstrainedBox',
      markdownPath: 'assets/markdowns/widget_catalog/layout/constrained_box_markdown.md',
      preview: _ConstrainedBoxWidgetImplementation(),
    );
  }
}

class _ConstrainedBoxWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'ConstrainedBox takes a BoxConstraints (minWidth, maxWidth, minHeight, maxHeight) and forces its child to live within those bounds. The child receives the intersection of the parent\'s constraints and the ones you supply, so ConstrainedBox can only tighten — never loosen — what the parent already allows.',
            ),
            TextBlock(
              'Use it to clamp a child\'s size without committing to an exact dimension (for that, use SizedBox). A common pattern is wrapping a child in ConstrainedBox(minWidth: x, maxWidth: y) to build a button or text field that grows but never collapses below a usable size.',
            ),
            Container(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 50,
                  minWidth: 100,
                  maxHeight: 100,
                  maxWidth: 100,
                ),
                child: Container(
                  color: Colors.amber,
                  height: 100,
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
