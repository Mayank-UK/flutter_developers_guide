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
              'RichText renders a tree of TextSpans, letting different fragments of a single block of text carry different styles — bold keywords, colored links, or differently sized runs on the same line. Each TextSpan can hold its own TextStyle and nest further spans as children.',
            ),
            TextBlock(
              'For most cases prefer Text.rich, which also picks up the surrounding DefaultTextStyle; reach for RichText directly when you need fine control over the text tree and the inherited default style. Note that properties like textAlign and maxLines live on the RichText itself, not on individual spans.',
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
