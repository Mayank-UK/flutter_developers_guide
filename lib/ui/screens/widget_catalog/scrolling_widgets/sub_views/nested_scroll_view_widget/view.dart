import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class NestedScrollViewWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'NestedScrollView',
      markdownPath: 'assets/markdowns/widget_catalog/scrolling/nested_scroll_view_markdown.md',
      preview: _NestedScrollViewWidgetImplementation(),
    );
  }
}

class _NestedScrollViewWidgetImplementation extends StatelessWidget {
  final List<String> _tabs = ['Tab 1', 'Tab 2'];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'NestedScrollView links a collapsing header (built from slivers) and an inner scrollable body so they share one scroll offset — the header shrinks/pins first, and only once it\'s fully collapsed does the body begin to scroll. It\'s the standard pattern for the "collapsing AppBar + TabBarView" layout.',
            ),
            TextBlock(
              'Coordinate the two halves with SliverOverlapAbsorber in the header and SliverOverlapInjector in the body so the pinned AppBar\'s height is subtracted correctly from each tab\'s scroll region. The body must be a scrollable that reports its scroll offsets upward (ListView, CustomScrollView, etc.).',
            ),
            Container(
              color: Colors.white,
              height: 500,
              child: DefaultTabController(
                length: _tabs.length,
                child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverOverlapAbsorber(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                        sliver: SliverAppBar(
                          title: const Text('Books'),
                          pinned: true,
                          expandedHeight: 150.0,
                          forceElevated: innerBoxIsScrolled,
                          bottom: TabBar(
                            tabs: _tabs
                                .map((String name) => Tab(text: name))
                                .toList(),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    children: _tabs.map((String name) {
                      return SafeArea(
                        top: false,
                        bottom: false,
                        child: Builder(
                          builder: (BuildContext context) {
                            return CustomScrollView(
                              key: PageStorageKey<String>(name),
                              slivers: <Widget>[
                                SliverOverlapInjector(
                                  handle: NestedScrollView
                                      .sliverOverlapAbsorberHandleFor(context),
                                ),
                                SliverPadding(
                                  padding: const EdgeInsets.all(8.0),
                                  sliver: SliverFixedExtentList(
                                    itemExtent: 48.0,
                                    delegate: SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {
                                        return ListTile(
                                          title: Text('Item $index'),
                                        );
                                      },
                                      childCount: 30,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
