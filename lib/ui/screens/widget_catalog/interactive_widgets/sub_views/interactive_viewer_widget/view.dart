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
              'InteractiveViewer adds pan, zoom, and rotate gestures to its child with pinch-to-zoom and drag-to-pan built in. Wrap an image, a map, a diagram, or any widget the user should be able to inspect closely — it constrains scale between minScale and maxScale and clips to a boundary margin.',
            ),
            TextBlock(
              'Set boundaryMargin: EdgeInsets.infinity to let the child roam freely beyond the viewport, and use the transformationController to programmatically reset or animate the view. It respects the alignment constraint, so a small child stays centered while a large child fills and overflows for panning.',
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
