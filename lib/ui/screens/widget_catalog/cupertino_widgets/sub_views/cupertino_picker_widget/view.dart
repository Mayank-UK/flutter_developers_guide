import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoPickerWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/cupertino/cupertino_picker_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'CupertinoPickerWidget',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _CupertinoPickerWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _CupertinoPickerWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoPicker is the iOS-style spinning wheel for selecting one item from a short list. Provide an itemExtent, a builder that returns a widget per index, and an onSelectedItemChanged callback that reports the centered index.',
            ),
            TextBlock(
              'For dates and times use CupertinoDatePicker (or CupertinoTimerPicker) instead — those are specialized wheels built on top of this one. Give the picker a bounded height; the wheel needs a fixed extent to lay out its rotating children.',
            ),
          ],
        ),
      ],
    );
  }
}
