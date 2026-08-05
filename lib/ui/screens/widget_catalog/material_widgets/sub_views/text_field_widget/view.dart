import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class TextFieldWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/text_field_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'TextField',
      mobileUi: [
        CodePreviewTabs(
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
              'TextField is the Material input for free-form text. It surfaces a cursor and the on-screen keyboard when tapped, and exposes the typed value through onChanged (or a controller for finer control: programmatic edits, selection, cursor position).',
            ),
            TextBlock(
              'Appearance is driven by decoration (an InputDecoration that controls the label, hint, icon, error text, and border shape). The keyboard type, autocorrect, obscureText, maxLength, and input formatters all live on TextField itself, so most input rules are a constructor argument away.',
            ),
            TextBlock(
              'Tip: prefer TextFormField over TextField inside a Form. TextFormField accepts a validator and integrates with Form.of(context) for submit-time validation, while a raw TextField leaves you wiring validation by hand.',
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
