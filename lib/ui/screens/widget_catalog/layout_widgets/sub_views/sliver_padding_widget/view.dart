import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class SliverPaddingWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/sliver_padding_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'SliverPadding',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _SliverPaddingWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _SliverPaddingWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'SliverPadding insets a sliver (rather than a box) by an EdgeInsets. Its child must itself be a sliver — SliverList, SliverGrid, SliverToBoxAdapter, or another SliverPadding — and the padding is applied to the sliver\'s scrollable area.',
            ),
            TextBlock(
              'Use it whenever you need to add gutters around sliver content inside a CustomScrollView: padding applied at the ScrollView level (EdgeInsets on the ListView or CustomScrollView) insets the whole scroll surface, but SliverPadding lets you pad only a specific sliver while leaving others (a pinned SliverAppBar, for instance) flush to the edges.',
            ),
            Container(
              color: Colors.white,
              height: 500,
              padding: const EdgeInsets.all(8),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.only(top: 64),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200.0,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 4.0,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Container(
                            alignment: Alignment.center,
                            color: Colors.teal[100 * (index % 9)],
                            child: Text('Grid Item $index'),
                          );
                        },
                        childCount: 20,
                      ),
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
