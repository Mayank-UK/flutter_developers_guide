import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoTabScaffoldWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/cupertino/cupertino_tab_scaffold_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'CupertinoTabScaffold',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _CupertinoTabScaffoldWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _CupertinoTabScaffoldWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoTabScaffold is the top-level structure for an iOS tabbed app: it places a CupertinoTabBar at the bottom and renders the active tab\'s content via a tabBuilder. Each tab keeps its own navigation state when combined with a CupertinoTabView per tab.',
            ),
            TextBlock(
              'This per-tab navigation isolation is what makes iOS tabbed apps preserve their history as you switch — switching back to a tab returns you to where you left off. For a Material-style equivalent use Scaffold with a BottomNavigationBar, but the navigation semantics differ.',
            ),
          ],
        ),
      ],
    );
  }
}
