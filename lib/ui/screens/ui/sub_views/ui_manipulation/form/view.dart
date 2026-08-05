import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class FormView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/form_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Form',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _FormImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _FormImplementation extends StatefulWidget {
  const _FormImplementation({Key? key}) : super(key: key);

  @override
  __FormImplementationState createState() => __FormImplementationState();
}

class __FormImplementationState extends State<_FormImplementation> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailFieldController;
  late TextEditingController _passwordFieldController;

  @override
  void initState() {
    super.initState();

    _emailFieldController = TextEditingController();
    _passwordFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _emailFieldController.dispose();
    _passwordFieldController.dispose();

    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'email: ${this._emailFieldController.text} && password: ${this._passwordFieldController.text}',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: '"Form" widget',
          content: [
            TextBlock(
              '"Form" aggregates multiple inputs into a single group so you can validate and save them together. Each input must be a "FormField" (typically "TextFormField"), and the form tracks their combined state.',
            ),
            TextBlock(
              'Pass a "GlobalKey<FormState>" to the form; "formKey.currentState.validate()" then runs every child validator and "formKey.currentState.save()" pushes values into your model. Without the key you cannot trigger validation programmatically.',
            ),
          ],
        ),
        SectionWrapper(
          title: '"TextFormField" widget for input and validation',
          content: [
            TextBlock(
              '"TextFormField" is the form-aware version of "TextField": it owns a controller and exposes a "validator" callback that returns an error string (or null when the value is acceptable). The returned string is rendered beneath the field automatically.',
            ),
            TextBlock(
              'Tip: validators run on submit and on every change once the field has been touched. Keep them pure and synchronous; for async checks (e.g. username availability) debounce in the controller and surface the result through a separate banner.',
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _emailFieldController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: const Icon(
                        Icons.email,
                      ),
                      hintText: 'Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter user id';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordFieldController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: const Icon(
                        Icons.password,
                      ),
                      hintText: 'Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter user id';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: _onSubmit,
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
