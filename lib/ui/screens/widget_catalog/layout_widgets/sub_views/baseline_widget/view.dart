import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class BaselineWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Baseline',
      markdownPath: 'assets/markdowns/widget_catalog/layout/baseline_markdown.md',
      preview: _BaselineWidgetImplementation(),
    );
  }
}

class _BaselineWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Baseline positions its child so that the child\'s baseline aligns with a given distance from the top of the Baseline widget. You supply a numeric baseline offset and a TextBaseline (alphabetic or ideographic); the widget then shifts the child vertically to line the baselines up.',
            ),
            TextBlock(
              'It is mostly used when mixing text with non-text widgets (icons, images, custom shapes) on a single line so the visual rhythm follows the text baseline rather than the bounding boxes. For ordinary layouts prefer CrossAxisAlignment.baseline on Row/Column — reach for Baseline directly only when you need to align outside a Flex.',
            ),
            Container(
              child: Container(
                color: Colors.teal,
                height: 200,
                margin: const EdgeInsets.only(
                  top: 64,
                ),
                width: 200,
                child: Baseline(
                  baseline: 0,
                  baselineType: TextBaseline.alphabetic,
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
