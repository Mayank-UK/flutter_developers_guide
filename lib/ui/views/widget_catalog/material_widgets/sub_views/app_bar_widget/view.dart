import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AppBarWidgetView extends StatelessWidget {
  final String _appBarTitle = 'AppBarView';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/app_bar_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _AppBarWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _AppBarWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"AppBar" widget has named parameters like title, backgroundColor, drawer, actions, etc, which specify the app bar.',
            ),
            TextBlock(
              '"AppBar" by default creates a back button when when a route is pushed in navigator stack.',
            ),
            Container(
              child: AppBar(
                title: Text('AppBar'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
