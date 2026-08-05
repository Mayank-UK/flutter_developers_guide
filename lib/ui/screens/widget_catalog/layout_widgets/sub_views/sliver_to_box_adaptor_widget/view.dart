import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class SliverToBoxAdaptorWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/sliver_to_box_adaptor_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'SliverToBoxAdaptor',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _SliverToBoxAdaptorWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _SliverToBoxAdaptorWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'SliverToBoxAdapter wraps an ordinary box widget so it can be used as a sliver inside a CustomScrollView. It is the bridge between the sliver world and the everyday box widget world.',
            ),
            TextBlock(
              'Use it to drop a non-sliver widget (a Card, a non-scrolling ListView with shrinkWrap, a header, an ad banner) into the middle of a custom scroll layout. Tip: each SliverToBoxAdapter is laid out eagerly, so for long or repeating content use a SliverList or SliverGrid instead of wrapping many items in one box adapter each.',
            ),
            Container(
              color: Colors.white,
              height: 500,
              padding: const EdgeInsets.all(8),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: ListView(
                      shrinkWrap: true,
                      children: List.generate(
                        10,
                        (index) {
                          return Container(
                            color: Colors.amber,
                            height: 50,
                            margin: const EdgeInsets.only(
                              bottom: 4,
                            ),
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
