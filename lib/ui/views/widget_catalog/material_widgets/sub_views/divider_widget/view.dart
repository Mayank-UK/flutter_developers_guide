import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class DividerWidgetView extends StatelessWidget {
  final String _appBarTitle = 'Divider';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/divider_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
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
              '"Divider" widget has named parameters like height, thickness, indent, etc, which specify the widget\'s behavior and UI.',
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
