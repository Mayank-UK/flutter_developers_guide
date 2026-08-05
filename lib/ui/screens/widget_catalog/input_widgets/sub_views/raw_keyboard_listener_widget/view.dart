import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class RawKeyboardListenerWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/input/raw_keyboard_listener_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'RawKeyboardListener',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _RawKeyboardListenerWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
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
            TextBlock(
              'RawKeyboardListener fires a callback for every key-down and key-up event from a physical keyboard, regardless of which child currently holds focus. It hands you a RawKeyEvent carrying both the physical key (HardwareKeyboard) and the logical key, so you can implement custom shortcuts or hardware-key navigation on desktop and web.',
            ),
            TextBlock(
              'This widget is now deprecated. For most shortcuts prefer the Shortcuts + Actions widgets, which are composable, respect focus, and bind to intents rather than raw scan codes — reach for raw key events only when you genuinely need low-level hardware input.',
            ),
          ],
        ),
      ],
    );
  }
}
