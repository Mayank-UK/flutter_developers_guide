import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoDatePickerWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'CupertinoDatePicker',
      markdownPath: 'assets/markdowns/widget_catalog/cupertino/cupertino_date_picker_markdown.md',
      preview: _CupertinoDatePickerWidgetImplementation(),
    );
  }
}

class _CupertinoDatePickerWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoDatePicker is the iOS-style wheel picker for dates and times — a set of spinning columns (month/day/year or hour/minute) that snap as you flick them. Use onDateTimeChanged to receive the selected value each time the wheels settle.',
            ),
            TextBlock(
              'Set mode: to choose between date, time, and dateAndTime layouts (plus a separate CupertinoTimerPicker for countdowns). Constrain its height; the picker needs a bounded box to lay out its rotating wheels.',
            ),
          ],
        ),
      ],
    );
  }
}
