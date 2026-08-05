import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class SliverAppBarWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/sliver_app_bar_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'SliverAppBar',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _SliverAppBarWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _SliverAppBarWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'SliverAppBar is the material app bar built as a sliver, so it can live inside a CustomScrollView and react to scroll offsets. When there is room (top of the list) it shows an expanded area driven by expandedHeight and flexibleSpace; as the user scrolls it shrinks down to a standard bar.',
            ),
            TextBlock(
              'The three behavioural flags combine: pinned keeps a collapsed bar visible at all times; floating lets the bar reappear on a reverse scroll without scrolling all the way back to the top; snap forces the bar to fully expand/collapse in one gesture rather than dragging. flexibleSpace (usually a FlexibleSpaceBar) holds the title and the background widget.',
            ),
            TextBlock(
              'Gotcha: floating: true with snap: true requires floating to also be true, and not every combination is valid. SliverAppBar only works as a direct sliver in a CustomScrollView (or other sliver context) — placing it as a normal child widget will not work.',
            ),
            Container(
              color: Colors.white,
              height: 500,
              padding: const EdgeInsets.all(8),
              child: Scaffold(
                body: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      pinned: true,
                      snap: true,
                      floating: true,
                      expandedHeight: 160.0,
                      flexibleSpace: const FlexibleSpaceBar(
                        title: Text('SliverAppBar'),
                        background: FlutterLogo(),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Container(
                            color: index.isOdd ? Colors.white : Colors.black12,
                            height: 100.0,
                            child: Center(
                              child: Text('$index', textScaleFactor: 5),
                            ),
                          );
                        },
                        childCount: 20,
                      ),
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
