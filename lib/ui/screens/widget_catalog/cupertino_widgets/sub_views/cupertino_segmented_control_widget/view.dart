import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoSegmentedControlWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/cupertino/cupertino_segmented_control_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'CupertinoSegmentedControl',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _CupertinoSegmentedControlWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _CupertinoSegmentedControlWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoSegmentedControl<T> is the classic iOS segmented control with hard-edged dividers. Pass a Map<T, Widget> of segments, groupValue for the current selection, and onValueChanged to receive the newly selected key — segments are mutually exclusive.',
            ),
            TextBlock(
              'The selected segment subtly expands while the others shrink. For the smoother iOS 13 pill-slide look, reach for CupertinoSlidingSegmentedControl instead; the classic control is the right choice when you want that crisp vintage iOS feel.',
            ),
          ],
        ),
      ],
    );
  }
}
