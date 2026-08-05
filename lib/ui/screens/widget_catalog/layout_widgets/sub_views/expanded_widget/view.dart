import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ExpandedWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Expanded',
      markdownPath: 'assets/markdowns/widget_catalog/layout/expanded_markdown.md',
      preview: _ExpandedWidgetImplementation(),
    );
  }
}

class _ExpandedWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Expanded can only be used as a direct child of a Flex (Row, Column, or Flex). It tells the flex layout to give this child a share of the leftover free space along the main axis, after the non-flexible children have been measured.',
            ),
            TextBlock(
              'The flex factor decides how the free space is divided: an Expanded with flex: 2 next to one with flex: 1 gets twice as much of the remaining room. Expanded also takes an optional fit (FlexFit.tight by default, which forces the child to fill the allotted space; FlexFit.loose lets the child be smaller). Use Flexible when you want "grow but don\'t force" behaviour.',
            ),
            Container(
              child: Expanded(
                child: Container(
                  color: Colors.amber,
                  height: 100,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
