import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class IntrinsicWidthWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'IntrinsicWidth',
      markdownPath: 'assets/markdowns/widget_catalog/layout/intrinsic_width_markdown.md',
      preview: _IntrinsicWidthWidgetImplementation(),
    );
  }
}

class _IntrinsicWidthWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'IntrinsicWidth sizes its child to the child\'s intrinsic width and then forces its descendants to share that width. It is the width-axis counterpart to IntrinsicHeight.',
            ),
            TextBlock(
              'Like IntrinsicHeight it triggers an extra speculative layout pass, so use it deliberately. A common use is forcing a Column of differently-sized children to all take the width of the widest one without explicitly measuring it yourself.',
            ),
          ],
        ),
      ],
    );
  }
}
