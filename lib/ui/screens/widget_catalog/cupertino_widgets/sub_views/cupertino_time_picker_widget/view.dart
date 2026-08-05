import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoTimePickerWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/cupertino/cupertino_time_picker_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'CupertinoTimePicker',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _CupertinoTimePickerWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _CupertinoTimePickerWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoTimerPicker is the iOS-style countdown picker — a wheel-based timer that lets the user dial in a Duration (hours:minutes:seconds). Use onTimerDurationChanged to receive the current value as the wheels turn.',
            ),
            TextBlock(
              'It is distinct from CupertinoDatePicker: this one is specifically for selecting an elapsed time / countdown, not a clock time or calendar date. Give it a bounded height; the wheel needs a fixed extent to lay out its rotating columns.',
            ),
          ],
        ),
      ],
    );
  }
}
