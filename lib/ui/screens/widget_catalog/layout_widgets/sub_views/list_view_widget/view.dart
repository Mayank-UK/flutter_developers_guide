import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ListViewWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/list_view_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'ListView',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _ListViewWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ListViewWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'ListView is the most-used scrollable in Flutter. It lays children out linearly along the scroll axis. Constructors cover the common cases: ListView (explicit children list), ListView.builder (lazy build by index), ListView.separated (with a separator widget between items), and ListView.custom (full SliverChildDelegate control).',
            ),
            TextBlock(
              'Key parameters: itemCount and itemBuilder drive a builder-style list; shrinkWrap lets the list take only the height of its content (use it when embedding inside another scroll view, at a performance cost); primary lets it participate in the nearest PrimaryScrollController; and physics controls overscroll/bouncing behaviour.',
            ),
            TextBlock(
              'Tip: for large or infinite lists always use ListView.builder with an itemCount — it builds only the visible items. Setting shrinkWrap: true defeats the lazy viewport optimisation, so prefer giving the ListView bounded height over shrink-wrapping wherever possible.',
            ),
            Container(
              height: 500,
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.amber,
                    height: 50,
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Center(
                      child: Text('Entry $index'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
