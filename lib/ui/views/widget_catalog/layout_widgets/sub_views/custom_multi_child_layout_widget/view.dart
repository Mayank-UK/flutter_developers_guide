import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CustomMultiChildLayoutWidgetView extends StatelessWidget {
  final String _appBarTitle = 'CustomMultiChildLayout';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/custom_multi_child_layout_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _CustomMultiChildLayoutWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _CustomMultiChildLayoutWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock('Rarely used widget.'),
            Container(),
          ],
        ),
      ],
    );
  }
}
