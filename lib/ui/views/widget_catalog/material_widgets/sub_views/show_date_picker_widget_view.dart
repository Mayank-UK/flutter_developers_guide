import 'package:flutter/material.dart';

import '../../../../components/code_preview_component.dart';
import './../../../../components/section_wrapper_component_component.dart';
import './../../../../components/text_block_component.dart';

class ShowDatePickerWidgetView extends StatelessWidget {
  final String _appBarTitle = 'ShowDatePicker';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/show_date_picker_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabsComponent(
      appBarTitle: this._appBarTitle,
      previewTab: _ShowDatePickerWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _ShowDatePickerWidgetImplementation extends StatefulWidget {
  @override
  __ShowDatePickerWidgetImplementationState createState() =>
      __ShowDatePickerWidgetImplementationState();
}

class __ShowDatePickerWidgetImplementationState
    extends State<_ShowDatePickerWidgetImplementation> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapperComponent(
          title: 'Simple use',
          content: [
            TextBlockComponent(
              'Date picker is shown using a function/method which returns a Future that will be successful after a user close the date picker dialog.',
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("${selectedDate.toLocal()}".split(' ')[0]),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Select date'),
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
