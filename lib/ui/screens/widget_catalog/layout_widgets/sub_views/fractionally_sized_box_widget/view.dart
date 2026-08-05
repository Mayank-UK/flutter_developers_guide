import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class FractionallySizedBoxWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/fractionally_sized_box_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'FractionallySizedBox',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _FractionallySizedBoxWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _FractionallySizedBoxWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'FractionallySizedBox sizes its child to a fraction (0.0–1.0) of its own available size, via widthFactor and heightFactor. Setting widthFactor to 0.5 makes the child take half the parent\'s width regardless of screen density — useful for "this button should be two-thirds of the screen wide" rules.',
            ),
            TextBlock(
              'The alignment parameter controls where the (potentially smaller) child sits inside FractionallySizedBox when the factors are less than 1. If you only need a width-percentage in a flex, prefer Expanded with a flex factor instead; reach for FractionallySizedBox when the proportion-of-parent sizing is the actual layout goal.',
            ),
            Container(
              height: 100,
              width: double.infinity,
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                heightFactor: 0.5,
                widthFactor: 0.5,
                child: Container(
                  color: Colors.amber,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
