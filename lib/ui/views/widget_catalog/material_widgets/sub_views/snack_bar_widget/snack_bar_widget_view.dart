import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class SnackBarWidgetView extends StatelessWidget {
  final String _appBarTitle = 'SnackBar';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/snack_bar_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _SnackBarWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _SnackBarWidgetImplementation extends StatelessWidget {
  void _onPressed(BuildContext context) {
    final SnackBar snackBar = SnackBar(
      content: const Text('Click/tap registered'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"SnackBar" widget is shown using a function/method, which then calls "ScaffoldMessenger" to render the snackBar.',
            ),
            TextBlock(
              '"SnackBar" has named parameter content, which show takes the content of snackbar, which is mostly text.',
            ),
            Container(
              child: ElevatedButton(
                onPressed: () => this._onPressed(context),
                child: Text('Show snackbar'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
