import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';

import '../../../../../../components/code_preview_tabs.dart';
import '../../../../../../components/section_wrapper.dart';

class AdaptiveLayoutView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/responsive_adaptive_layout/adaptive_layout_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Adaptive layout',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _AdaptiveLayoutImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _AdaptiveLayoutImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Adaptive layout',
          content: [
            TextBlock(
                "This basically means developing UI based on platform. Like building UI for ios or android, they both have different styles of UI."),
            TextBlock(
                "Flutter have built-in widgets that help implement the ui styles like android or ios. Material widger is for android and Cupertino widget is for ios.")
          ],
        ),
      ],
    );
  }
}
