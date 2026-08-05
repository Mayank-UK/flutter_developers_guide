import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class OutlinedButtonWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/outlined_button_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'OutlinedButton',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _OutlinedButtonWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _OutlinedButtonWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'OutlinedButton is a Material button with a visible border outline and no fill — the middle step in the elevation hierarchy. It signals an important but secondary action ("Cancel", "Back", "Discard"), less prominent than ElevatedButton but more affordant than a TextButton.',
            ),
            TextBlock(
              'Because its border is a visible affordance, OutlinedButton works well next to an ElevatedButton in a row — e.g. "Discard" (outlined) beside "Save" (elevated) — communicating both options while making the primary one the obvious default.',
            ),
            TextBlock(
              'Tip: this is the renamed, border-styled successor to the deprecated OutlineButton. As with the other Material buttons, set onPressed to null to disable rather than wrapping in an IgnorePointer.',
            ),
            Container(
              child: OutlinedButton(
                onPressed: () {},
                child: Text(
                  'Button',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
