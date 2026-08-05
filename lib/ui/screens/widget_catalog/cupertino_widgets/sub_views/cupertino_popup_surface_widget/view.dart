import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoPopupSurfaceWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/cupertino/cupertino_popup_surface_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'CupertinoPopupSurfaceWidgetView',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _CupertinoPopupSurfaceWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _CupertinoPopupSurfaceWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoPopupSurface is the rounded-rectangle background that gives iOS popups (dialogs, action sheets) their signature look — a soft-cornered white card with a subtle shadow. It paints the chrome and hosts your content as its child.',
            ),
            TextBlock(
              'Most apps never use it directly: CupertinoAlertDialog and CupertinoActionSheet compose it for you. Reach for CupertinoPopupSurface only when you are building a fully custom popup that should still feel native iOS.',
            ),
          ],
        ),
      ],
    );
  }
}
