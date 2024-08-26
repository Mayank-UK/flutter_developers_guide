import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class DefaultTextStyleWidgetView extends StatelessWidget {
  final String _appBarTitle = 'DefaultTextStyle';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/text/default_text_style_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _DefaultTextStyleWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _DefaultTextStyleWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"DefaultTextStyle" widget has named parameters like style, textAlign, etc, which specify the default text style of it\'s children.',
            ),
            Container(
              child: DefaultTextStyle(
                style: TextStyle(fontSize: 36, color: Colors.blue),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Default text',
                    ),
                    const Text(
                      'Override default text',
                      style: TextStyle(fontSize: 24),
                    ),
                    const Text(
                      'Default text',
                      style: TextStyle(color: Colors.red),
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
