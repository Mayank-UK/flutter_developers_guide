import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class RichTextWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/text/rich_text_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'RichText',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _RichTextWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _RichTextWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"RichText" has named parameters like text, textAlign, etc, which specify it\'s children behavior.',
            ),
            TextBlock(
              '"TextSpan" is used mostly as the child of "RichText" widget, using it we can have different text style in a same line or paragraph.',
            ),
            Container(
              child: RichText(
                text: TextSpan(
                  text: 'Hello ',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'bold',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' world!'),
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
