import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';
import '../../../../../../../components/text_block.dart';

class FocusBehaviorView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/interactive_behaviours/focus_behavior_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Focus behavior',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _FocusBehaviorImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _FocusBehaviorImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'What focus means',
          content: [
            TextBlock(
              'Focus marks the widget that currently receives keyboard input. It is essential for accessibility (keyboard-only and screen-reader users) and for any non-touch flow: Tab/Shift-Tab traversal, Enter to activate, and typing into form fields all rely on a correct focus chain.',
            ),
            TextBlock(
              'The "Focus" and "FocusScope" widgets manage this chain; "FocusNode" is the controller you create, attach to a widget, and dispose manually. Read "FocusNode.hasFocus" to render focused vs. idle states (e.g. a colored border around a text field).',
            ),
            TextBlock(
              'Tip: every interactive widget should expose a "focusNode" and respond to focus visually. Wrap custom controls in "Focus" with an "onFocusChange" callback, and use "AutofocusGroup" to place the cursor in the first field when a form opens.',
            ),
          ],
        ),
      ],
    );
  }
}
