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
              'This widget is rarely used directly, consider using  ListView.',
            ),
            Container(),
          ],
        ),
      ],
    );
  }
}
