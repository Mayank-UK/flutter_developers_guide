import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ShowDatePickerWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'ShowDatePicker',
      markdownPath: 'assets/markdowns/widget_catalog/material/show_date_picker_markdown.md',
      preview: _ShowDatePickerWidgetImplementation(),
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
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'showDatePicker is an imperative function (not a widget) that opens a modal calendar dialog and returns a Future<DateTime?>. The user picks a single date within a constrained range; the Future resolves with that date or null if the user cancels.',
            ),
            TextBlock(
              'firstDate and lastDate define the legal range — useful for blocking past dates (a booking after today) or future ones (a date of birth). The initialDate should sit inside that range, otherwise the picker clamps it on open.',
            ),
            TextBlock(
              'Tip: showTimePicker is the sibling function for time selection, and locale-aware localization is built in if you supply a locales-supported MaterialApp. Both return null on dismissal, so always null-check the result before using it.',
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
