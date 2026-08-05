import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class TextWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/text/text_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Text',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _TextWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _TextWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Text is the fundamental widget for displaying a run of read-only text. Pass a String and an optional TextStyle; when you omit the style, Text inherits the look from the nearest DefaultTextStyle (which ultimately comes from your theme).',
            ),
            TextBlock(
              'Use it for labels, paragraphs, button captions — anywhere you need a single, uniform style across a string. For richer needs: set maxLines with overflow: TextOverflow.ellipsis to truncate with trailing dots, and reach for RichText or Text.rich when one span needs to mix bold, color, or links.',
            ),
            Container(
              child: Text(
                'Sample text',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
