import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/code_preview_tabs.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/components/section_wrapper.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';

class WidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget/widget_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Widget',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _WidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _WidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Basics',
          content: [
            TextBlock("Show widgets on home screen."),
          ],
        ),
      ],
    );
  }
}
