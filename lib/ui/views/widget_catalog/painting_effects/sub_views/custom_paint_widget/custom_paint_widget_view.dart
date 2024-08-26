import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CustomPaintWidgetView extends StatelessWidget {
  final String _appBarTitle = 'CustomPaint';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/painting_effects/custom_paint_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _CustomPaintWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
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
            TextBlock('Will be updated later.'),
            Container(),
          ],
        ),
      ],
    );
  }
}
