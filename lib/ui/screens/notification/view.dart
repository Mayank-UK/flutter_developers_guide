import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/code_preview_tabs.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/components/section_wrapper.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';

class NotificationView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/navigation_routing/imperative_approach_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Notifications',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _ImperativeRoutingImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ImperativeRoutingImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Basics',
          content: [
            TextBlock(
              'Show notification in the app.',
            ),
          ],
        ),
      ],
    );
  }
}
