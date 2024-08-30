import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ColumnWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/column_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Column',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _ColumnWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ColumnWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"Column" widget takes a number of children and places them vertically one after the another.',
            ),
            TextBlock(
              'It has a named parameter alignment, which specify the alignment of it\'s children.',
            ),
            Container(
              child: Container(
                color: Colors.amber,
                padding: const EdgeInsets.all(8),
                width: 100,
                child: Column(
                  children: [
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      height: 16,
                    ),
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      height: 16,
                    ),
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
