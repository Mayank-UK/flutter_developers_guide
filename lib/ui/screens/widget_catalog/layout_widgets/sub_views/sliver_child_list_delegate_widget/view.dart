import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class SliverChildListDelegateWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'SliverChildListDelegate',
      markdownPath: 'assets/markdowns/widget_catalog/layout/sliver_child_list_delegate_markdown.md',
      preview: _SliverChildListDelegateWidgetImplementation(),
    );
  }
}

class _SliverChildListDelegateWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'SliverChildListDelegate is a SliverChildDelegate backed by an explicit List<Widget>. You hand it a pre-built list of children and pass it to a SliverList / SliverGrid. It is the sliver counterpart of ListView(children:...) — every child is built up-front regardless of which are visible.',
            ),
            TextBlock(
              'Prefer it when the dataset is small and known at build time, since it is simpler than a builder and avoids index arithmetic. For long or dynamic lists switch to SliverChildBuilderDelegate so that off-screen items are not constructed.',
            ),
            Container(
              color: Colors.white,
              height: 500,
              padding: const EdgeInsets.all(8),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate(
                      List.generate(
                        10,
                        (index) {
                          return Container(
                            color: Colors.amber,
                            height: 100,
                            margin: const EdgeInsets.only(bottom: 4),
                          );
                        },
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
