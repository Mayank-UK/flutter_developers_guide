import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ScrollbarWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/scrolling/scrollbar_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Scrollbar',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _ScrollbarWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ScrollbarWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Scrollbar wraps a scrollable to show a Material-style thumb indicating where you are within its content. Use thumbVisibility (formerly isAlwaysShown) to keep it on screen instead of fading, and hover features on desktop for a track that grows when the pointer approaches.',
            ),
            TextBlock(
              'The thumb needs to know the scrollable\'s extent, so wire the same ScrollController into both the Scrollbar and the ListView/GridView it wraps. With ListView.builder the thumb still works — just make sure a controller is shared and the scrollable has enough content to overflow, otherwise there\'s nothing for the thumb to indicate.',
            ),
            Container(
              height: 500,
              child: Scrollbar(
                thumbVisibility: true,
                child: ListView(
                  children: List.generate(
                    50,
                    (index) {
                      return Container(
                        alignment: Alignment.center,
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
            ),
          ],
        ),
      ],
    );
  }
}
