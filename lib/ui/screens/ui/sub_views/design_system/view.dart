import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/code_preview_tabs.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/components/section_wrapper.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';

class DesignSystemView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/design_system/design_system_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Design system',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _AlignmentImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _AlignmentImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Basics',
          content: [
            TextBlock(
              'Design system is implemented using Theme object of material widget. The colors will update automatically based on light/dark mode selected by the user.',
            ),
          ],
        ),
      ],
    );
  }
}
