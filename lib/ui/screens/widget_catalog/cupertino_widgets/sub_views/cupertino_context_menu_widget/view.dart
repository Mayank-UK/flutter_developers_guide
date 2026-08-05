import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoContextMenuWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'CupertinoContextMenu',
      markdownPath: 'assets/markdowns/widget_catalog/cupertino/cupertino_context_menu_markdown.md',
      preview: _CupertinoContextMenuWidgetImplementation(),
    );
  }
}

class _CupertinoContextMenuWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoContextMenu wraps a child and opens an iOS 13-style preview sheet when the user long-presses: the child expands into a full-screen card with a list of CupertinoContextMenuAction choices. Use it to attach contextual actions to images, cards, or list items.',
            ),
            TextBlock(
              'Wrap the same widget you want to preview — Flutter measures it for the expansion animation. Each action carries an icon, title, and isDestructiveAction flag, and an onPressed that pops the menu and performs the action.',
            ),
          ],
        ),
      ],
    );
  }
}
