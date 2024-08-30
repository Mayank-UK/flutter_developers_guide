import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class NestedScrollViewWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/scrolling/nested_scroll_view_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'NestedScrollView',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _NestedScrollViewWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
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
              '"NestedScrollView" widget has named parameters like headerSliverBuilder, body, etc which specify the different sections of the widget.',
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
