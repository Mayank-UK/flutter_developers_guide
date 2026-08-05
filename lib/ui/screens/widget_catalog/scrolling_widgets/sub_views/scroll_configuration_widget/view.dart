import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ScrollConfigurationWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/scrolling/scroll_configuration_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'ScrollConfiguration',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _ScrollConfigurationWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ScrollConfigurationWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'ScrollConfiguration controls how Scrollable widgets behave across a subtree — which ScrollPhysics they use, how overscroll looks, and the default scrolling gestures. It\'s the seam through which platform conventions (iOS bounce vs. Android glow/clamping) are applied.',
            ),
            TextBlock(
              'Wrap a subtree to override the inherited behavior for everything below: pass behavior: ScrollConfiguration.of(context).copyWith(physics: ...) to swap physics while keeping the rest, or set a fresh MaterialPlatform/Cupertino style. It\'s how you make a single iOS-style bouncing list inside an otherwise Android app.',
            ),
          ],
        ),
      ],
    );
  }
}
