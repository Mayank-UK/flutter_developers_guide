import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class SliverGridWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/sliver_grid_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'SliverGrid',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _SliverGridWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _SliverGridWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'SliverGrid is a sliver that arranges its children in a two-dimensional grid. It takes a SliverGridDelegate (which describes the columns and tile aspect ratio) and a SliverChildDelegate (which supplies the children). It is the sliver equivalent of GridView and is meant to live inside a CustomScrollView alongside other slivers.',
            ),
            TextBlock(
              'Two ready-made delegates cover most cases: SliverGridDelegateWithFixedCrossAxisCount (a fixed number of columns) and SliverGridDelegateWithMaxCrossAxisExtent (columns auto-fit to a maximum tile width). Pair with SliverChildBuilderDelegate for large, lazy datasets.',
            ),
            Container(
              color: Colors.white,
              height: 500,
              padding: const EdgeInsets.all(8),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverGrid(
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
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
