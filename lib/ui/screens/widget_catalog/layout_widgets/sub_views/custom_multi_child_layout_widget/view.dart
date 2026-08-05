import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CustomMultiChildLayoutWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'CustomMultiChildLayout',
      markdownPath: 'assets/markdowns/widget_catalog/layout/custom_multi_child_layout_markdown.md',
      preview: _CustomMultiChildLayoutWidgetImplementation(),
    );
  }
}

class _CustomMultiChildLayoutWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CustomMultiChildLayout delegates the sizing and positioning of all of its children to a MultiChildLayoutDelegate you write. The delegate implements performLayout(Size, MultiChildLayoutDelegate.measureChild / positionChild), giving you full control over where each identified child ends up.',
            ),
            TextBlock(
              'Use it when you need a one-off layout that no built-in widget provides (overlapping diagrams, custom charts, complex toolbars). For new code prefer the combination of Stack + Positioned, CustomPaint, or LayoutBuilder — they cover most needs with far less boilerplate. CustomMultiChildLayout is rarely the right answer.',
            ),
          ],
        ),
      ],
    );
  }
}
