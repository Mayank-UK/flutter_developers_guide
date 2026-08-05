import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class MergeSemanticsWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'MergeSemantics',
      markdownPath: 'assets/markdowns/widget_catalog/accessibility/merge_semantics_markdown.md',
      preview: _MergeSemanticsWidgetImplementation(),
    );
  }
}

class _MergeSemanticsWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
                'MergeSemantics combines the semantics of all its descendants into a single node, so assistive technology reads them as one phrase. Use it to pair a control with its label — a Checkbox next to the word "Settings" — so a screen reader announces "Settings, checked" as one tappable item rather than two unrelated ones.'),
            TextBlock(
              'Don\'t merge nodes that need to be individually focusable. Collapsing a row of independent buttons into one node means the user can\'t reach each button separately, which is usually a regression in accessibility rather than an improvement.',
            ),
            Container(
              child: MergeSemantics(
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: true,
                      onChanged: (bool? value) {},
                    ),
                    const Text("Settings"),
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
