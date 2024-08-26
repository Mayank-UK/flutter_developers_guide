import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ScrollableWidgetView extends StatelessWidget {
  final String _appBarTitle = 'Scrollable';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/interactive/scrollable_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _ScrollableWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _ScrollableWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock('This widget is rarely used directly.'),
          ],
        ),
      ],
    );
  }
}
