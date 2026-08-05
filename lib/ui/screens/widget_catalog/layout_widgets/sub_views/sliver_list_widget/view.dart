import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class SliverListWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'SliverList',
      markdownPath: 'assets/markdowns/widget_catalog/layout/sliver_list_markdown.md',
      preview: _SliverListWidgetImplementation(),
    );
  }
}

class _SliverListWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'SliverList is a sliver that lays its children out in a linear array along the main axis. It is the sliver counterpart of ListView and is composed inside a CustomScrollView to build mixed scrolling surfaces (lists next to grids, app bars, pinned headers, etc.).',
            ),
            TextBlock(
              'You supply a SliverChildDelegate — SliverChildBuilderDelegate for lazy, index-driven children, or SliverChildListDelegate for an explicit list. SliverList supports variable item heights, so for lists where every item has the same extent SliverFixedExtentList scrolls more efficiently.',
            ),
            Container(
              color: Colors.white,
              height: 500,
              padding: const EdgeInsets.all(8),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Container(
                          color: index.isOdd ? Colors.white : Colors.black12,
                          height: 100.0,
                          child: Center(
                            child: Text('$index', textScaler: TextScaler.linear(5)),
                          ),
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
