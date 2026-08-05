import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class LimitedBoxWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'LimitedBox',
      markdownPath: 'assets/markdowns/widget_catalog/layout/limited_box_markdown.md',
      preview: _LimitedBoxWidgetImplementation(),
    );
  }
}

class _LimitedBoxWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'LimitedBox imposes a maximum width and height on its child, but only when the child receives unbounded constraints (i.e. the parent does not already cap the size). When the parent is bounded, LimitedBox is a no-op.',
            ),
            Container(
              child: LimitedBox(
                maxHeight: 50,
                maxWidth: 50,
                child: Container(
                  color: Colors.amber,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
