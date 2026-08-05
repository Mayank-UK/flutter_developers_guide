import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoDialogWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/cupertino/cupertino_dialog_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'CupertinoDialog',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _CupertinoDialogWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _CupertinoDialogWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoDialog is the lower-level iOS-style dialog container: a rounded popup surface that hosts arbitrary content. It is the building block beneath CupertinoAlertDialog.',
            ),
            TextBlock(
              'Most apps reach for CupertinoAlertDialog, which composes this surface together with title, content, and action buttons. Use CupertinoDialog directly only when you need a custom dialog layout the higher-level widget can\'t express.',
            ),
          ],
        ),
      ],
    );
  }
}
