import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AspectRatioWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/aspect_ratio_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'AspectRatio',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _AspectRatioWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _AspectRatioWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'AspectRatio sizes its child to a target width-to-height ratio (for example 16/9 or 1.0 for a square). It computes the missing dimension from the bounded one: if the parent gives unlimited width but a fixed height, the widget derives the width from the height and vice-versa.',
            ),
            TextBlock(
              'Use it for responsive media boxes (video frames, thumbnails, avatars) where you cannot hardcode pixel sizes but must keep a consistent shape. If the child has its own intrinsic size preferences, wrap it in AspectRatio rather than fighting with manually computed SizedBox values.',
            ),
            Container(
              child: AspectRatio(
                aspectRatio: 4 / 2,
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
