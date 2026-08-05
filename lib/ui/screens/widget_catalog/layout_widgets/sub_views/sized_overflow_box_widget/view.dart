import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class SizedOverflowBoxWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'SizedOverflowBox',
      markdownPath: 'assets/markdowns/widget_catalog/layout/sized_overflow_box_markdown.md',
      preview: _SizedOverflowBoxWidgetImplementation(),
    );
  }
}

class _SizedOverflowBoxWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'SizedOverflowBox is a hybrid: it reports a fixed size (the size parameter) to its parent, but passes the parent\'s original constraints through to its child — so the child is laid out as if SizedOverflowBox did not exist and can overflow the reported box.',
            ),
            TextBlock(
              'Use it when a child needs to keep its natural size for hit-testing and painting while the surrounding layout treats the slot as a specific dimension. Unlike OverflowBox (which overrides the child\'s constraints), SizedOverflowBox keeps the child\'s layout intact and only changes what the parent sees.',
            ),
            Container(
              child: Container(
                color: Colors.amber,
                child: SizedOverflowBox(
                  size: const Size(
                    80.0,
                    100.0,
                  ),
                  child: Container(
                    height: 50.0,
                    width: 200.0,
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
