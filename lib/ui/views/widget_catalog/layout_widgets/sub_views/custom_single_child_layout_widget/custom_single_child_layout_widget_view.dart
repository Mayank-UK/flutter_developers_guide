import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CustomSingleChildLayoutWidgetView extends StatelessWidget {
  final String _appBarTitle = 'CustomSingleChildLayout';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/custom_single_child_layout_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _CustomSingleChildLayoutWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _CustomSingleChildLayoutWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock('Very rarely used widget.'),
            Container(),
          ],
        ),
      ],
    );
  }
}
