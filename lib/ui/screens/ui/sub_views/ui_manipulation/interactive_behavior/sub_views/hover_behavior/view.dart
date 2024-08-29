import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';

class HoverBehaviorView extends StatelessWidget {
  final String _appBarTitle = 'Hover behavior';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/interactive_behaviours/hover_behavior_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      mobileUi: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _HoverBehaviorImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _HoverBehaviorImplementation extends StatelessWidget {
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
