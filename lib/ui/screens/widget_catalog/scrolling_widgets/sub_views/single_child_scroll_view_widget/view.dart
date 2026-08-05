import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class SingleChildScrollViewWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/scrolling/single_child_scroll_view_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'SingleChildScrollView',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _SingleChildScrollViewWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _SingleChildScrollViewWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'SingleChildScrollView makes a single child scrollable when it overflows the available space. Wrap any non-scrollable box — a Column, Row, Wrap, or just a tall Container — and the user can pan it when content doesn\'t fit.',
            ),
            TextBlock(
              'It\'s the simplest way to make a form or settings page scrollable, but because it builds the whole child up front it doesn\'t lazy-build. For long lists use ListView/GridView instead, which only materialize the visible items; reach for SingleChildScrollView when you have one bounded subtree that just needs to scroll on small screens.',
            ),
            Container(
              color: Colors.white,
              height: 500,
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      color: Colors.amber,
                      height: 200,
                      width: double.infinity,
                      child: Text('Section 1'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.red,
                      height: 200,
                      margin: const EdgeInsets.only(top: 8),
                      width: double.infinity,
                      child: Text('Section 2'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.green,
                      height: 200,
                      margin: const EdgeInsets.only(top: 8),
                      width: double.infinity,
                      child: Text('Section 3'),
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
