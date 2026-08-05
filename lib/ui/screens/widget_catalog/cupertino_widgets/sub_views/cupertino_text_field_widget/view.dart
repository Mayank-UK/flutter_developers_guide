import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoTextFieldWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'CupertinoTextField',
      markdownPath: 'assets/markdowns/widget_catalog/cupertino/cupertino_text_field_markdown.md',
      preview: _CupertinoTextFieldWidgetImplementation(),
    );
  }
}

class _CupertinoTextFieldWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoTextField is the iOS-style single-line text input: rounded border, system cursor, and optional prefix/suffix widgets (icons, clear buttons). Read its value through onChanged/onSubmitted or by attaching a TextEditingController.',
            ),
            TextBlock(
              'Use decoration: to switch between plain, boxed, and rounded border styles, and keyboardAppearance/keyboardType to control the keyboard. For a Material-style input reach for TextField/TextFormField; those also give you richer validation and Material theming out of the box.',
            ),
          ],
        ),
      ],
    );
  }
}
