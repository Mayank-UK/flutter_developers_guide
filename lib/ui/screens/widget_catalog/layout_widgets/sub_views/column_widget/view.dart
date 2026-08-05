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
              'A Column arranges its children vertically, top to bottom. It is one of the two Flex widgets (Row is the horizontal counterpart) and is the default choice for any stack of widgets on a phone screen.',
            ),
            TextBlock(
              'mainAxisAlignment controls how children are distributed along the vertical axis (start, center, spaceBetween, spaceEvenly, spaceAround), while crossAxisAlignment controls how each child is placed horizontally inside the column. The column will be as tall as its children need unless you wrap specific children in Expanded or Flexible.',
            ),
            TextBlock(
              'Gotcha: Column sizes itself to its parent\'s height only when at least one child is Expanded/Flexible; otherwise it tries to wrap its children and will overflow if they exceed the screen. Set mainAxisSize to MainAxisSize.min when embedding a Column inside another vertical scroller to avoid unbounded-height assertion errors.',
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
