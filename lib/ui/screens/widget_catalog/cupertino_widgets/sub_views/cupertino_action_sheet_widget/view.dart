import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoActionSheetWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'CupertinoActionSheet',
      markdownPath: 'assets/markdowns/widget_catalog/cupertino/cupertino_action_sheet_markdown.md',
      preview: _CupertinoActionSheetWidgetImplementation(),
    );
  }
}

class _CupertinoActionSheetWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoActionSheet is the iOS-style modal bottom sheet that slides up to present a list of choices. Each option is a CupertinoActionSheetAction, and you can attach a separate Cancel section; destructive actions render in red.',
            ),
            TextBlock(
              'Show it via showCupertinoModalPopup with the action sheet as the child. Use it for contextual choices ("Delete / Share / Cancel") rather than for primary navigation, and reserve the destructive style for genuinely irreversible actions.',
            ),
          ],
        ),
      ],
    );
  }
}
