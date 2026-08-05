import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class IconButtonWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/icon_button_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'IconButton',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _IconButtonWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _IconButtonWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'IconButton is a Material button that renders only an icon inside an ink splash. It is the standard way to put actions into an AppBar (trailing actions), a Toolbar, or any compact UI where a labelled button would be visually heavy.',
            ),
            TextBlock(
              'Because the button has no text label, its meaning must be obvious from the icon. For less-universal icons, wrap the IconButton in a Tooltip (or pass tooltip:) so users who long-press or hover see a textual hint.',
            ),
            TextBlock(
              'Tip: choose the right variant for the surface — FloatingActionButton for the primary action, IconButton for secondary actions, and the icon-only versions ofFilledButton/OutlinedButton/TextButton when you want a unified visual style with the rest of your button family.',
            ),
            Container(
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.ac_unit,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
