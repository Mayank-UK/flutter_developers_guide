import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CardWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/card_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Card',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _CardWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _CardWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Card is a Material container with rounded corners, a subtle elevation shadow, and a default surface color. It groups related content — such as a list item with leading art, a title, a subtitle, and trailing action buttons — into one visually distinct block.',
            ),
            TextBlock(
              'Its shape, margin, and elevation are themable, so a Card inherits the app\'s look automatically. It is a thin wrapper: it does not impose any internal padding or layout, so you compose the contents (usually a Column or a ListTile) yourself.',
            ),
            TextBlock(
              'Gotcha: Card clips its content to its rounded shape only when you set clipBehavior; otherwise an elevated child (like an ink splash) can paint past the corners.',
            ),
            Container(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.album),
                      title: const Text('The Enchanted Nightingale'),
                      subtitle:
                          Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('BUY TICKETS'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('LISTEN'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                      ],
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
