import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AlertDialogWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation = 'assets/markdowns/widget_catalog/material/alert_dialog_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'AlertDialog',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _AlertDialogWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _AlertDialogWidgetImplementation extends StatelessWidget {
  Future<void> _showDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: Text('This is a demo alert dialog.'),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"AlertDialog" widget is shown using a method which returns a Future that completes when the dialog is dismissed.',
            ),
            Container(
              child: ElevatedButton(
                onPressed: () => this._showDialog(context),
                child: Text(
                  'Show alert dialog',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
