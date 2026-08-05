import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ListBodyWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/list_body_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'ListBody',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _ListBodyWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ListBodyWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'ListBody arranges its children sequentially along the main axis (vertical by default) and forces them to fill the cross axis. It does not scroll — it just stacks children, growing as large as they need.',
            ),
            TextBlock(
              'You usually want ListView instead: ListView is scrollable, lazy, and handles the common cases of large or dynamic lists. ListBody is mostly useful inside a CustomScrollView or when you deliberately want a non-scrolling sequential column whose cross-axis behaviour differs from Column.',
            ),
          ],
        ),
      ],
    );
  }
}
