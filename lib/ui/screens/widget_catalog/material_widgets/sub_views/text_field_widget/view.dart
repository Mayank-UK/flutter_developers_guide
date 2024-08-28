import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class TextFieldWidgetView extends StatelessWidget {
  final String _appBarTitle = 'TextField';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/text_field_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _TextFieldWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _TextFieldWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"TextField" widget has named parameters like style, decoration, etc, which specify the widget\'s behavior and content.',
            ),
            TextBlock(
              'One major difference b/w "TextField" and "TextFormField" is validation, "TextFormField" has a named parameter to specify the validation logic.',
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(hintText: 'placeholder'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
