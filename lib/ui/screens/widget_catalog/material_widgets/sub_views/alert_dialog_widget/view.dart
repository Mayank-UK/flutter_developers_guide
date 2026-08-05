import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AlertDialogWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'AlertDialog',
      markdownPath: 'assets/markdowns/widget_catalog/material/alert_dialog_markdown.md',
      preview: _AlertDialogWidgetImplementation(),
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
              'AlertDialog is a Material dialog that interrupts the user with a modal popup requiring an acknowledgement. It is composed of a title, a textual content body, and a row of action buttons (typically Cancel / Approve).',
            ),
            TextBlock(
              'It is not placed directly on the widget tree — you push it with showDialog(), which returns a Future that resolves when the dialog is dismissed. That Future makes it ideal for confirmations ("Delete this item?") where you need to branch the flow on the user\'s choice.',
            ),
            TextBlock(
              'Tip: pass barrierDismissible: false when the user must make an explicit decision (forcing a button tap rather than a tap-outside-to-cancel), and always provide at least one action — otherwise the dialog cannot be closed.',
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
