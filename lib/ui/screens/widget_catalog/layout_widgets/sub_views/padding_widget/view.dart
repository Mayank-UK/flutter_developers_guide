import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class PaddingWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/padding_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Padding',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _PaddingWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _PaddingWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Padding insets its child by an EdgeInsets (all, only, symmetric, fromLTRB). It is the single-purpose, fast widget for adding empty space inside a widget — the same effect Container(padding:...) produces internally, but cheaper and clearer in intent.',
            ),
            TextBlock(
              'Tip: prefer Padding over a Container whose only styling parameter is padding. The const EdgeInsets constructors (const EdgeInsets.all(16)) let Padding be a compile-time constant, which keeps widget trees cheap.',
            ),
            Container(
              child: Container(
                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
