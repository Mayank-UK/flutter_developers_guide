import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoDialogActionWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/cupertino/cupertino_dialog_action_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'CupertinoDialogAction',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _CupertinoDialogActionWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _CupertinoDialogActionWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoDialogAction is the button used inside a CupertinoAlertDialog (and the older CupertinoDialog). It carries a text label and an onPressed that dismisses the dialog when tapped.',
            ),
            TextBlock(
              'Mark the recommended choice with isDefaultAction (bolds the text) and any destructive choice with isDestructiveAction (red text). Flutter lays them out automatically — two side by side, three or more stacked.',
            ),
          ],
        ),
      ],
    );
  }
}
