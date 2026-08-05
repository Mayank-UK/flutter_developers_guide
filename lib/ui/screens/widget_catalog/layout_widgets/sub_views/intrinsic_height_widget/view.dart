import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class IntrinsicHeightWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/intrinsic_height_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'IntrinsicHeight',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _IntrinsicHeightWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _IntrinsicHeightWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'IntrinsicHeight sizes its child to the child\'s intrinsic height — the height the child would "want" to be, ignoring the parent\'s unbounded height constraint. After measuring, it forces all of its descendants to share that same height.',
            ),
            TextBlock(
              'It is the answer to "make the children of a Row all the same height when they would otherwise be sized independently." The cost is real: IntrinsicHeight performs a speculative layout pass on its subtree, which can be expensive in deep trees. Use it sparingly and never inside a scrolling list at scale.',
            ),
          ],
        ),
      ],
    );
  }
}
