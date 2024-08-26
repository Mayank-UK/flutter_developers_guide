import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';

class FormView extends StatelessWidget {
  final String _appBarTitle = 'Form';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/form_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _FormImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
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
            Container(
              child: Text(
                  '"Form" widget serves as a container for all the inputs and other form related elements.'),
            ),
            Container(
              child: Text(
                  'It is recommended to create a global key for form widget to access it easily using this global key.'),
            ),
          ],
        ),
        SectionWrapper(
          title: '"TextFormField" widget for input and validation',
          content: [
            Container(
              child: Text(
                  '"TextFoldField" widget is used for taking input from the user.'),
            ),
            Container(
              child: Text(
                  '"TextFoldField" widget has a named parameter "validator", which takes a function as a value and return true for success and false for failure.'),
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
