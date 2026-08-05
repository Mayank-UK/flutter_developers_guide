import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CustomPaintWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/painting_effects/custom_paint_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'CustomPaint',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _CustomPaintWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _CustomPaintWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CustomPaint hands you a Canvas during the paint phase so you can draw arbitrary graphics — shapes, paths, gradients, charts, sprites — by supplying a CustomPainter. It is the escape hatch when no composed widget will do: bespoke illustrations, data visualizations, animated backgrounds, game art.',
            ),
            TextBlock(
              'Keep the painter cheap and pure: state should live outside it, and redraws should be driven through the `repaint` argument (typically a ChangeNotifier or Animation) so Flutter can cache the resulting layer. Heavy allocation or work inside paint will jank the frame.',
            ),
          ],
        ),
      ],
    );
  }
}
