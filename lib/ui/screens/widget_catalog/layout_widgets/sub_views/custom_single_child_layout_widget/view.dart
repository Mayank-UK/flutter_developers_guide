import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CustomSingleChildLayoutWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'CustomSingleChildLayout',
      markdownPath: 'assets/markdowns/widget_catalog/layout/custom_single_child_layout_markdown.md',
      preview: _CustomSingleChildLayoutWidgetImplementation(),
    );
  }
}

class _CustomSingleChildLayoutWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CustomSingleChildLayout hands the layout of its single child to a SingleChildLayoutDelegate, whose getSize and getPositionForChild override the default child placement. It is the lowest-level escape hatch for one-off custom single-child layouts.',
            ),
            TextBlock(
              'In modern Flutter you almost never need it: LayoutBuilder + Stack/Positioned, Transform, Align, or a small CustomPaint cover the same ground declaratively. Reach for CustomSingleChildLayout only when you need pixel-exact constraint math that no combination of stock widgets can express.',
            ),
          ],
        ),
      ],
    );
  }
}
