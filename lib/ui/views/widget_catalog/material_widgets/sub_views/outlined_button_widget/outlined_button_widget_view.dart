import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class OutlinedButtonWidgetView extends StatelessWidget {
  final String _appBarTitle = 'OutlinedButton';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/outlined_button_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _OutlinedButtonWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _OutlinedButtonWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"OutlinedButton" widget has named parameters onPressed and child, which specify the button\'s behavior and content.',
            ),
            Container(
              child: OutlinedButton(
                onPressed: () {},
                child: Text(
                  'Button',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
