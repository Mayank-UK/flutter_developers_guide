import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ExpandedWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/expanded_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Expanded',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _ExpandedWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ExpandedWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Expanded can only be used as a direct child of a Flex (Row, Column, or Flex). It tells the flex layout to give this child a share of the leftover free space along the main axis, after the non-flexible children have been measured.',
            ),
            TextBlock(
              'The flex factor decides how the free space is divided: an Expanded with flex: 2 next to one with flex: 1 gets twice as much of the remaining room. Expanded also takes an optional fit (FlexFit.tight by default, which forces the child to fill the allotted space; FlexFit.loose lets the child be smaller). Use Flexible when you want "grow but don\'t force" behaviour.',
            ),
            Container(
              child: Expanded(
                child: Container(
                  color: Colors.amber,
                  height: 100,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
