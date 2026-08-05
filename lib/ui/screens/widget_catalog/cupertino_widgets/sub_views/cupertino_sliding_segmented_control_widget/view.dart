import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoSlidingSegmentedControlWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'CupertinoSlidingSegmentedControl',
      markdownPath: 'assets/markdowns/widget_catalog/cupertino/cupertino_sliding_segmented_control_markdown.md',
      preview: _CupertinoSlidingSegmentedControlWidgetImplementation(),
    );
  }
}

class _CupertinoSlidingSegmentedControlWidgetImplementation
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoSlidingSegmentedControl<T> is the iOS 13 segmented control where the selection is a pill that slides between options with a smooth animation, instead of the hard-edged resize of the classic control. API is a Map<T, Widget> of children plus groupValue and onValueChanged.',
            ),
            TextBlock(
              'Use it for modern mutually-exclusive selection — view-mode toggles, list/grid switching. Keep the children lightweight since they all stay mounted while the thumb slides between them.',
            ),
          ],
        ),
      ],
    );
  }
}
