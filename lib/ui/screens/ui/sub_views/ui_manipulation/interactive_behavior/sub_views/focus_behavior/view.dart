import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';

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
          title: 'content will be available soon',
          content: [],
        ),
      ],
    );
  }
}
