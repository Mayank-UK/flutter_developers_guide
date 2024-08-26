import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class FloatingActionButtonWidgetView extends StatelessWidget {
  final String _appBarTitle = 'FloatingActionButton';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/floating_action_button_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _FloatingActionButtonWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _FloatingActionButtonWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"FloatingActionButton" has named parameters onPressed and child, which specify the button\'s behavior and it\'s content.',
            ),
            Container(
              child: FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
