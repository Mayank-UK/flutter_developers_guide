import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoDialogActionWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'CupertinoDialogAction',
      markdownPath: 'assets/markdowns/widget_catalog/cupertino/cupertino_dialog_action_markdown.md',
      preview: _CupertinoDialogActionWidgetImplementation(),
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
