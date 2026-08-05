import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoContextMenuWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/cupertino/cupertino_context_menu_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'CupertinoContextMenu',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _CupertinoContextMenuWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
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
