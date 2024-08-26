import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class RawKeyboardListenerWidgetView extends StatelessWidget {
  final String _appBarTitle = 'RawKeyboardListener';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/input/raw_keyboard_listener_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _RawKeyboardListenerWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _RawKeyboardListenerWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock('Very rarely used widget'),
            Container(),
          ],
        ),
      ],
    );
  }
}
