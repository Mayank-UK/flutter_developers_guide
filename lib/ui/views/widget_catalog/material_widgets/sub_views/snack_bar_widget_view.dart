import 'package:flutter/material.dart';

import '../../../../components/code_preview_component.dart';
import './../../../../components/section_wrapper_component_component.dart';
import './../../../../components/text_block_component.dart';

class SnackBarWidgetView extends StatelessWidget {
  final String _appBarTitle = 'SnackBar';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/snack_bar_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabsComponent(
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
        SectionWrapperComponent(
          title: 'Simple use',
          content: [
            TextBlockComponent(
              '"SnackBar" widget is shown using a function/method, which then calls "ScaffoldMessenger" to render the snackBar.',
            ),
            TextBlockComponent(
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
