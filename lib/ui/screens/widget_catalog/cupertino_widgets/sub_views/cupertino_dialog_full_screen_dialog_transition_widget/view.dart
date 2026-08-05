import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoFullScreenDialogTransitionWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/cupertino/cupertino_fullscreen_dialog_transition_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'CupertinoFullScreenDialogTransition',
      mobileUi: [
        CodePreviewTabs(
          previewTab:
              _CupertinoFullScreenDialogTransitionWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _CupertinoFullScreenDialogTransitionWidgetImplementation
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoFullscreenDialogTransition is the iOS-style vertical slide-up transition applied to full-screen modal pages (think "Compose new email"). It fades the incoming page in while sliding it up from the bottom.',
            ),
            TextBlock(
              'You rarely instantiate it. CupertinoPageRoute applies it automatically when fullscreenDialog: true is set on the route; reach for the widget directly only when building a fully custom route that needs to mimic the system transition.',
            ),
          ],
        ),
      ],
    );
  }
}
