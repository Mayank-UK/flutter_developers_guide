import 'package:flutter/material.dart';

import '../../../components/main_appbar_component.dart';

import '../../../../core/router/routes.dart';
import '../../../components/custom_final_stage_listview_component.dart';

class InputWidgetsView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
      title: 'Autocomplete',
      description:
          'A widget for helping the user make a selection by entering some text and choosing from among a list of options.',
      route: RoutePaths.autocomplete,
    ),
    ListViewItem(
      title: 'Form',
      description:
          'An optional container for grouping together multiple form field widgets (e.g. TextField widgets).',
      route: RoutePaths.form,
    ),
    ListViewItem(
      title: 'TextFormField',
      description:
          'A single form field. This widget maintains the current state of the form field, so that updates and validation errors are visually reflected in the UI.',
      route: RoutePaths.formField,
    ),
    ListViewItem(
      title: 'RawKeyboardListener',
      description:
          'A widget that calls a callback whenever the user presses or releases a key on a keyboard.',
      route: RoutePaths.rawKeyboardListener,
    ),
  ];

  final String _appBarTitle = 'Input widgets';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBarComponent(appBarTitle: this._appBarTitle),
      body: CustomFinalStageListViewComponent(
        itemList: _itemList,
      ),
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
