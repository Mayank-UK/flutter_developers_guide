import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class RowWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Row',
      markdownPath: 'assets/markdowns/widget_catalog/layout/row_markdown.md',
      preview: _RowWidgetImplementation(),
    );
  }
}

class _RowWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Row lays its children out horizontally, left to right. It is the horizontal Flex (Column is the vertical counterpart) and the default choice for any inline arrangement of widgets — button bars, list tiles, toolbars.',
            ),
            TextBlock(
              'mainAxisAlignment controls free-space distribution along the horizontal axis (start, center, spaceBetween, spaceEvenly, spaceAround), and crossAxisAlignment controls how each child is placed vertically inside the row. Wrap a child in Expanded or Flexible to give it a share of the row\'s free width.',
            ),
            TextBlock(
              'Gotcha: an unbounded-width parent (for example, a horizontal ListView or a Column whose cross axis is unbounded) will assert, because Row needs a finite horizontal constraint to distribute. If you see "RenderFlex children have non-zero flex but the width constraints are unbounded", wrap the Row in an Expanded or give it bounded width.',
            ),
            Container(
              color: Colors.amber,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
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
