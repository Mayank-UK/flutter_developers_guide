import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class PopupMenuButtonWidgetView extends StatelessWidget {
  final String _appBarTitle = 'PopupMenuButton';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/popup_menu_button_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _PopupMenuButtonWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _PopupMenuButtonWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"PopupMenuButton" widget has named parameters onSelected and itemBuilder, which specify the button\'s behavior and content.',
            ),
            TextBlock(
              '"PopupMenuButton" widget uses "PopMenuItem" as it\'s child, which in turn has named parameters child and value, the value is passed to a function that will be used for "onSelected".',
            ),
            Container(
              color: Colors.blue,
              child: PopupMenuButton(
                itemBuilder: (BuildContext bc) => [
                  PopupMenuItem(
                    child: Text("New Chat"),
                    value: "/newchat",
                  ),
                  PopupMenuItem(
                    child: Text("New Group Chat"),
                    value: "/new-group-chat",
                  ),
                  PopupMenuItem(
                    child: Text("Settings"),
                    value: "/settings",
                  ),
                ],
                onSelected: (value) {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
