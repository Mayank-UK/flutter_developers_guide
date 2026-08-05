import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoScrollbarWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/cupertino/cupertino_scrollbar_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'CupertinoScrollBar',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _CupertinoScrollbarWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _CupertinoScrollbarWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoScrollbar is the iOS-style scrollbar: a thin thumb that fades in while the user scrolls and fades out shortly after. Wrap a scrollable to show it; it indicates which slice of the content is currently visible.',
            ),
            TextBlock(
              'Unlike the Material Scrollbar it has no hover-track and no interactive drag by default. Pass the same ScrollController to both the scrollbar and the scrollable so the thumb reflects the correct extent and position.',
            ),
          ],
        ),
      ],
    );
  }
}
