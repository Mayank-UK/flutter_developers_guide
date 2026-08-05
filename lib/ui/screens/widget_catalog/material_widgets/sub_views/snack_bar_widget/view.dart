import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class SnackBarWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/snack_bar_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'SnackBar',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _SnackBarWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _SnackBarWidgetImplementation extends StatelessWidget {
  void _onPressed(BuildContext context) {
    final SnackBar snackBar = SnackBar(
      content: const Text('Click/tap registered'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'SnackBar is a brief, non-blocking Material message that slides in at the bottom of the screen to confirm an action ("Item deleted"), report a recoverable error, or offer an inline action ("Undo"). It disappears after a few seconds without requiring the user to dismiss it.',
            ),
            TextBlock(
              'It is shown via ScaffoldMessenger.of(context).showSnackBar(...), not placed on the widget tree directly. The Messenger manages a queue so a new SnackBar replaces an old one safely across route changes — which is why you should never cache the BuildContext used to show one.',
            ),
            TextBlock(
              'Tip: if the message is critical or requires a decision, use an AlertDialog or a Banner instead. SnackBars are easy to miss; only put "you can probably ignore this" content in them.',
            ),
            Container(
              child: ElevatedButton(
                onPressed: () => this._onPressed(context),
                child: Text('Show snackbar'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
