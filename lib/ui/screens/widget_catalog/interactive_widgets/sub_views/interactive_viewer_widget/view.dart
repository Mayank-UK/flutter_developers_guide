import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class InteractiveViewerWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/interactive/interactive_viewer_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'InteractiveViewer',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _InteractiveViewerWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _InteractiveViewerWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"InteractiveViewer" widget has named parameters like boundaryMargin, minScale, maxScale, etc, which specify the widget behavior.',
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.amber,
              height: 200,
              width: 200,
              child: InteractiveViewer(
                boundaryMargin: const EdgeInsets.all(20.0),
                minScale: 5,
                maxScale: 20,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
