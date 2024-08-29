import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ScaffoldWidgetView extends StatelessWidget {
  final String _appBarTitle = 'Scaffold';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/scaffold_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      mobileUi: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _ScaffoldWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ScaffoldWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"Scaffold" widget is used mainly as the root widget for a page. It has named parameters like appBar, body, bottomNavigationBar, etc, which specify the layout of a page.',
            ),
            Container(),
          ],
        ),
      ],
    );
  }
}
