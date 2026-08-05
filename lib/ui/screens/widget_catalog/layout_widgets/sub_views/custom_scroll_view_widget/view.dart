import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CustomScrollViewWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'CustomScrollView',
      markdownPath: 'assets/markdowns/widget_catalog/layout/custom_scroll_view_markdown.md',
      preview: _CustomScrollViewWidgetImplementation(),
    );
  }
}

class _CustomScrollViewWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CustomScrollView is a ScrollView whose children are slivers rather than ordinary box widgets. Because every child participates in the same scroll coordinate space, you can compose heterogeneous scrolling effects — a SliverAppBar that collapses over a SliverGrid that transitions into a SliverFixedExtentList — inside one scrollable surface.',
            ),
            TextBlock(
              'The slivers list is the heart of the API: plug in SliverToBoxAdapter (to drop a normal box widget in), SliverList, SliverGrid, SliverPersistentHeader, and friends. Use controller / physics / center for advanced scroll behaviour such as bidirectional or parallax effects.',
            ),
            Container(
              color: Colors.white,
              height: 500,
              padding: const EdgeInsets.all(8),
              child: CustomScrollView(
                slivers: <Widget>[
                  const SliverAppBar(
                    pinned: true,
                    expandedHeight: 250.0,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text('Demo'),
                    ),
                  ),
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
                  SliverFixedExtentList(
                    itemExtent: 50.0,
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Container(
                          alignment: Alignment.center,
                          color: Colors.lightBlue[100 * (index % 9)],
                          child: Text('List Item $index'),
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
