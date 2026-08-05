import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class LinearProgressIndicatorWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'LinearProgressIndicator',
      markdownPath: 'assets/markdowns/widget_catalog/material/linear_progress_indicator_markdown.md',
      preview: _LinearProgressIndicatorWidgetImplementation(),
    );
  }
}

class _LinearProgressIndicatorWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'LinearProgressIndicator is a horizontal Material bar that conveys progress along a single axis. Without a value it animates as an indeterminate "we are working, hold on" strip; pass value (0.0 to 1.0) to render a determinate bar that fills as work advances.',
            ),
            TextBlock(
              'The linear form suits operations with a measurable size — file downloads, multi-step uploads, a long form. The circular variant reads better in tight spaces (inside a button, beside a label) where a horizontal bar would not fit.',
            ),
            TextBlock(
              'Tip: keep loading states honest. An indeterminate bar shown for minutes tells the user nothing about how long they will wait; if you can compute progress, switch to a determinate value, even an approximate one.',
            ),
            Container(
              child: LinearProgressIndicator(
                semanticsLabel: 'Linear progress indicator',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
