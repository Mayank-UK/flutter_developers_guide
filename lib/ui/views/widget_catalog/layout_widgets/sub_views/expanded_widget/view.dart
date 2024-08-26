import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ExpandedWidgetView extends StatelessWidget {
  final String _appBarTitle = 'Expanded';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/expanded_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _ExpandedWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _ExpandedWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"Expanded" widget takes up all the available space for it\'s child.',
            ),
            Container(
              child: Expanded(
                child: Container(
                  color: Colors.amber,
                  height: 100,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
