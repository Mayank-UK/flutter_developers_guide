import 'package:flutter/material.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';

class FocusBehaviorView extends StatelessWidget {
  final String _appBarTitle = 'Focus behavior';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/interactive_behaviours/focus_behavior_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _FocusBehaviorImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _FocusBehaviorImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'content will be available soon',
          content: [],
        ),
      ],
    );
  }
}
