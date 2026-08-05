import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class SizedBoxWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/sized_box_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'SizedBox',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _SizedBoxWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _SizedBoxWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'SizedBox forces its child (or itself, when no child is given) to a specific width and/or height. It is the simplest, cheapest sizing widget and the standard way to introduce fixed spacing or a fixed dimension into a layout.',
            ),
            TextBlock(
              'Pass a child to make SizedBox constrain that child; omit the child to use it as a transparent gap (the same role Spacer or an empty Container plays, but with a single fixed dimension). SizedBox is also commonly used to give an unbounded child a bounded dimension before placing it in a flex.',
            ),
            Container(
              child: SizedBox(
                height: 100,
                width: 100,
                child: Container(
                  color: Colors.amber,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
