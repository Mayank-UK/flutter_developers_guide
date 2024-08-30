import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class OverFlowBoxWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/overflow_box_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'OverFlowBox',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _OverFlowBoxWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _OverFlowBoxWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"OverflowBox" widget has named parameters like maxWidth, maxHeight, etc, which specify the overflowing nature of it\'s child.',
            ),
            Container(
              color: Colors.amber,
              height: 50,
              child: OverflowBox(
                maxWidth: 200,
                maxHeight: 200,
                child: Container(
                  color: Colors.red,
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
