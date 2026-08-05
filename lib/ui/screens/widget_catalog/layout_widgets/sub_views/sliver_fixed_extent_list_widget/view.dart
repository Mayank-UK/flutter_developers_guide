import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class SliverFixedExtentListWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/sliver_fixed_extent_list_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'SliverFixedExtentList',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _SliverFixedExtentListWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _SliverFixedExtentListWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'SliverFixedExtentList is a sliver that lays out its children along the main axis with a single fixed itemExtent in pixels. Because every tile is exactly the same height, the sliver can compute scroll offsets, jump-to-index, and viewport maths in O(1) — much more efficiently than a variable-height SliverList.',
            ),
            TextBlock(
              'Use it whenever your items have a uniform height (or width, for a horizontal scroll). You will lose the per-item flexibility, but gain precise index-to-offset math — the foundation for features like scrollToIndex, calendar rows, and fixed-height timelines.',
            ),
            Container(
              color: Colors.white,
              height: 500,
              padding: const EdgeInsets.all(8),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverFixedExtentList(
                    itemExtent: 50.0,
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Container(
                          alignment: Alignment.center,
                          color: Colors.lightBlue[100 * (index % 9)],
                          child: Text('list item $index'),
                        );
                      },
                    ),
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
