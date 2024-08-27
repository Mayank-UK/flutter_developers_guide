import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../core/router/routes.dart';
import '../../../components/links.dart';

class InputWidgetsView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
      title: 'Autocomplete',
      description:
          'A widget for helping the user make a selection by entering some text and choosing from among a list of options.',
      route: RoutePaths.autocomplete,
    ),
    LinkItem(
      title: 'Form',
      description:
          'An optional container for grouping together multiple form field widgets (e.g. TextField widgets).',
      route: RoutePaths.form,
    ),
    LinkItem(
      title: 'TextFormField',
      description:
          'A single form field. This widget maintains the current state of the form field, so that updates and validation errors are visually reflected in the UI.',
      route: RoutePaths.formField,
    ),
    LinkItem(
      title: 'RawKeyboardListener',
      description:
          'A widget that calls a callback whenever the user presses or releases a key on a keyboard.',
      route: RoutePaths.rawKeyboardListener,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Input widgets",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: const Text('Processing Data')));
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
