import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoSearchFieldWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'CupertinoSearchField',
      markdownPath: 'assets/markdowns/widget_catalog/cupertino/cupertino_search_field_markdown.md',
      preview: _CupertinoSearchFieldWidgetImplementation(),
    );
  }
}

class _CupertinoSearchFieldWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoSearchTextField is the iOS-style search box: a rounded grey field with a leading magnifier icon, placeholder text, and an optional clear/cancel button. Use onChanged or onSubmitted to drive a filter over a list shown below.',
            ),
            TextBlock(
              'It manages its own TextEditingController internally; pass your own controller only if you need to read or preset the value. For a Material-style search input, use a plain TextField with the appropriate decoration instead.',
            ),
          ],
        ),
      ],
    );
  }
}
