import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class TooltipWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/tool_tip_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Tooltip',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _TooltipWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _TooltipWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Tooltip wraps any widget to show a short text label when the user long-presses (touch) or hovers (mouse) over it. It is the standard way to make icon-only buttons and other ambiguous affordances accessible — both for users (a textual hint) and for screen readers (the message becomes the semantic label).',
            ),
            TextBlock(
              'A Tooltip is invisible in normal use; it only appears on the long-press/hover gesture, then fades out automatically. Set message to the explanatory string, and optionally customize height, padding, decoration, and waitDuration to control how long the press must last before the tip appears.',
            ),
            TextBlock(
              'Tip: every icon-only IconButton already accepts a tooltip: argument, so prefer that over nesting an IconButton inside a separate Tooltip — you get the same accessibility behavior with less code.',
            ),
            Container(
              child: Tooltip(
                message: 'Tooltip demo',
                child: TextButton(
                    onPressed: () {},
                    child: const Text('hover over for tooltip')),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
