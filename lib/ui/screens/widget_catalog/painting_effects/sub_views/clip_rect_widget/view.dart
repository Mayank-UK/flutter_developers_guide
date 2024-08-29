import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ClipRectWidgetView extends StatelessWidget {
  final String _appBarTitle = 'ClipRect';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/painting_effects/clip_r_rect_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      mobileUi: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _ClipRectWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ClipRectWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"ClipRRect" widget has named parameter borderRadius, which specifies the clipping of corners.',
            ),
            Container(
              color: Colors.amber,
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: Colors.red,
                  height: 80,
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
