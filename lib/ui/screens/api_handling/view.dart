import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/code_preview_tabs.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/components/section_wrapper.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';

class ApiHandlingView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/api_handling/api_handling_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'API handling',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _ApiHandlingImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ApiHandlingImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Basics',
          content: [
            TextBlock("Handle API calls properly."),
          ],
        ),
      ],
    );
  }
}
