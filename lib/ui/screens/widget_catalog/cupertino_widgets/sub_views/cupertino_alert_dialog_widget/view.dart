import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoAlertDialogWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'CupertinoAlertDialog',
      markdownPath: 'assets/markdowns/widget_catalog/cupertino/cupertino_alert_dialog_markdown.md',
      preview: _CupertinoAlertDialogWidgetImplementation(),
    );
  }
}

class _CupertinoAlertDialogWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoAlertDialog is the iOS-style centered alert: a rounded card with an optional title, content, and a horizontal row of CupertinoDialogAction buttons. Use it for urgent, decision-requiring messages that must be dismissed before continuing.',
            ),
            TextBlock(
              'Show it with showCupertinoDialog. Two buttons sit side by side; with three or more they stack vertically. Mark the primary choice as isDefaultAction and any destructive one as isDestructiveAction so they pick up the expected styling.',
            ),
          ],
        ),
      ],
    );
  }
}
