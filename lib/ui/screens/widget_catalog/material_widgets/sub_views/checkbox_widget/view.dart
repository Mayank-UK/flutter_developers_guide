import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CheckboxWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Checkbox',
      markdownPath: 'assets/markdowns/widget_catalog/material/checkbox_markdown.md',
      preview: _CheckboxWidgetImplementation(),
    );
  }
}

class _CheckboxWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Checkbox is a Material toggle that lets the user select zero, one, or many options from a set. It is a pure "value display" widget — it only renders the box; the label text alongside it is your responsibility, typically placed in a ListTile.',
            ),
            TextBlock(
              'The widget is controlled externally via value and notifies changes through onChanged, so you store the checked state in your own state object. Setting onChanged to null disables the checkbox and renders it greyed out.',
            ),
            TextBlock(
              'Tip: for a checkbox with a built-in label and tap target that fills the row (no manual GestureDetector needed), use CheckboxListTile instead of composing a ListTile + Checkbox yourself.',
            ),
            Container(
              child: Checkbox(
                onChanged: (value) {},
                value: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
