import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ScrollableWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/interactive/scrollable_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Scrollable',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _ScrollableWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ScrollableWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Scrollable is the low-level widget that implements the scroll interaction model — gesture recognition, the ScrollController/ScrollPosition, and viewport coordination — without committing to how the children are actually built. ListView, GridView, PageView, and CustomScrollView all compose it.',
            ),
            TextBlock(
              'You rarely instantiate Scrollable itself; the named scrollables cover almost every case and feed slivers into a viewport for you. Reach for it directly only when you need a completely custom viewport that none of the higher-level scroll widgets can express.',
            ),
          ],
        ),
      ],
    );
  }
}
