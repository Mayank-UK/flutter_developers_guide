import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class FormFieldWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'FormField',
      markdownPath: 'assets/markdowns/widget_catalog/input/form_field_markdown.md',
      preview: _FormFieldWidgetImplementation(),
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
              'Form groups multiple FormField widgets (such as TextFormField) under a shared key so you can validate, save, and reset them as a unit. Give it a GlobalKey<FormState>, then call _formKey.currentState!.validate() on submit to run every child\'s validator and surface errors automatically.',
            ),
            TextBlock(
              'A TextFormField still works standalone outside a Form, but you lose grouped validation and reset. To plug a custom control into the same pipeline, subclass FormField<T> — that\'s the contract Form walks when it traverses its descendants.',
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
