import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class FormFieldWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/input/form_field_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'FormField',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _FormFieldWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _FormFieldWidgetImplementation extends StatefulWidget {
  @override
  __FormFieldWidgetImplementationState createState() =>
      __FormFieldWidgetImplementationState();
}

class __FormFieldWidgetImplementationState
    extends State<_FormFieldWidgetImplementation> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"Form" widget serves as the container widget for various "FormField" widgets.',
            ),
            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(),
                    TextFormField(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
