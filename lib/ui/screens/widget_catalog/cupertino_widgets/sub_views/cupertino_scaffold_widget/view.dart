import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoScaffoldWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/cupertino/cupertino_scaffold_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'CupertinoScaffold',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _CupertinoScaffoldWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _CupertinoScaffoldWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoPageScaffold is the iOS-style page layout: it positions a CupertinoNavigationBar above a content area, all painted on a background color. It is the Cupertino counterpart of the Material Scaffold.',
            ),
            TextBlock(
              'Set navigationBar (a CupertinoNavigationBar) and child (your page content). It handles the safe-area insets and the navigation bar\'s height for you; for tabbed apps compose it inside a CupertinoTabScaffold instead of nesting your own bottom bar.',
            ),
          ],
        ),
      ],
    );
  }
}
