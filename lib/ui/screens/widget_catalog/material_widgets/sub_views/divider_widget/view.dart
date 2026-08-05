import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class DividerWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/divider_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Divider',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _DividerWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _DividerWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Divider is a thin horizontal line (one logical pixel by default) used to separate groups of content within a Column or a ListView. height controls the total vertical gap the widget occupies, while thickness controls the line itself.',
            ),
            TextBlock(
              'Use indent and endIndent to inset the line from the leading and trailing edges — handy when items above and below the divider have leading icons and you want the rule to start where the text starts rather than at the screen edge.',
            ),
            TextBlock(
              'Tip: for a divider between ListView items that handles the awkward "no divider before the first or after the last item" rule for you, use ListView.separated instead of decorating each child manually.',
            ),
            Container(
              child: Divider(
                height: 20,
                thickness: 5,
                indent: 20,
                endIndent: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
