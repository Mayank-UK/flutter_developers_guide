import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class SliverChildBuilderDelegateWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'SliverChildBuilderDelegate',
      markdownPath: 'assets/markdowns/widget_catalog/layout/sliver_child_builder_delegate_markdown.md',
      preview: _SliverChildBuilderDelegateWidgetImplementation(),
    );
  }
}

class _SliverChildBuilderDelegateWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'SliverChildBuilderDelegate is a SliverChildDelegate that lazily builds sliver children from a builder callback (BuildContext, int index) => Widget. You pair it with childCount so the sliver knows how many items exist. It is the sliver equivalent of ListView.builder\'s itemBuilder.',
            ),
            TextBlock(
              'Use it with SliverList, SliverGrid, or SliverFixedExtentList when the dataset is large or built on demand — children beyond the visible viewport are never constructed until they scroll into view. For a small fixed set of children, SliverChildListDelegate is simpler.',
            ),
            TextBlock(
              'Tip: pass findChildIndexCallback for reverse lookups (e.g. keys → indices) to make ReorderableListView-style remeasurements efficient, and consider a SemanticIndexCallback if your items need stable semantic ordering.',
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
