import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class DefaultTextStyleWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/text/default_text_style_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'DefaultTextStyle',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _DefaultTextStyleWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _DefaultTextStyleWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'DefaultTextStyle establishes an implicit TextStyle that every descendant Text widget inherits unless it sets its own. Wrap a subtree once and every child Text picks up that look without repeating `style` on each one.',
            ),
            TextBlock(
              'Child styles merge rather than replace: a Text that supplies only fontSize keeps the inherited color and weight, and only overrides size. This is the same mechanism Text uses to inherit from MaterialApp\'s theme — reach for it when you want a localized style region, such as a card where all text should be small and muted.',
            ),
            Container(
              child: DefaultTextStyle(
                style: TextStyle(fontSize: 36, color: Colors.blue),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Default text',
                    ),
                    const Text(
                      'Override default text',
                      style: TextStyle(fontSize: 24),
                    ),
                    const Text(
                      'Default text',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
