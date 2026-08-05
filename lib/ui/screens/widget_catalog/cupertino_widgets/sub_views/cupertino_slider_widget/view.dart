import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoSliderWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/cupertino/cupertino_slider_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'CupertinoSlider',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _CupertinoSliderWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _CupertinoSliderWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoSlider is the iOS-style slider for selecting from a continuous range. Provide value (clamped between min and max), onChanged while the user drags, and onChangeEnd to commit the final value once they release.',
            ),
            TextBlock(
              'The thumb animates with the signature iOS spring as the value changes. Use it for adjustable settings like volume or playback position; for snapping between a few discrete steps, a segmented control is usually a better fit.',
            ),
          ],
        ),
      ],
    );
  }
}
