import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CircularProgressIndicatorWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'CircularProgressIndicator',
      markdownPath: 'assets/markdowns/widget_catalog/material/circular_progress_indicator_markdown.md',
      preview: _CircularProgressIndicatorWidgetImplementation(),
    );
  }
}

class _CircularProgressIndicatorWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CircularProgressIndicator is a Material spinner that conveys an in-progress operation of indeterminate length. With no value supplied it rotates continuously; supply a double between 0.0 and 1.0 to render a determinate arc that fills as work progresses.',
            ),
            TextBlock(
              'Use the indeterminate form for short, unquantifiable waits (a network call, a brief load). Reserve determinate progress for tasks where you actually know how far along you are — showing a determinate bar that never moves is worse than an honest spinner.',
            ),
            TextBlock(
              'Tip: always set semanticsLabel so screen readers announce "Loading" instead of reading the underlying canvas, and keep spinners small unless they are the focal point of a full-screen loading state.',
            ),
            Container(
              child: CircularProgressIndicator(
                semanticsLabel: 'Circular progress indicator',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
