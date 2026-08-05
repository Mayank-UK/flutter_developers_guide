import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class WrapWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/wrap_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Wrap',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _WrapWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _WrapWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Wrap lays its children out sequentially and, when it runs out of room on the current line, flows them onto the next line. Think of it as a Row/Column that knows how to break across lines — the standard choice for tag clouds, chip lists, and any "fit as many as possible, wrap the rest" layout.',
            ),
            TextBlock(
              'direction chooses horizontal vs vertical runs; spacing is the gap between children on the same run; runSpacing is the gap between the runs themselves; alignment positions children within a run; runAlignment positions the runs inside the Wrap. There is no mainAxisSize — Wrap always takes only the room its runs need.',
            ),
            Container(
              color: Colors.amber,
              padding: const EdgeInsets.all(8),
              child: Wrap(
                spacing: 8,
                children: [
                  Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
