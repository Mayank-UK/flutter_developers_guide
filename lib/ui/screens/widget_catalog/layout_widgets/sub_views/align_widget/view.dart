import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AlignWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/align_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Align',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _AlignWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _AlignWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Align positions a single child at a specific point inside the parent\'s box, described by an Alignment (for example centerRight, topLeft, or a fractional Alignment(-1, 1)). It is the go-to widget when you need to push a small widget to one edge without manually computing offsets.',
            ),
            TextBlock(
              'Tip: by default Align sizes itself to fill its parent (widthFactor / heightFactor are null, so it expands). Pass widthFactor and heightFactor to make Align shrink-wrap the child instead — handy for overlays and badges where you do not want Align to consume the whole available area.',
            ),
            Container(
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  color: Colors.amber,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
