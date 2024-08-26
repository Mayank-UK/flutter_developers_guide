import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ListTileWidgetView extends StatelessWidget {
  final String _appBarTitle = 'ListTile';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/list_tile_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _ListTileWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _ListTileWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"ListTile" widget has named parameters like trailing, title, etc, which specify the widget\'s behavior and UI.',
            ),
            TextBlock(
              '"ListTile" widget is mainly used inside "ListView" widget, but can also be used separately.',
            ),
            Container(
              color: Colors.amber,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    child: ListTile(
                      leading: FlutterLogo(),
                      title: const Text('ListTile'),
                    ),
                  ),
                  Container(
                    child: ListTile(
                      trailing: FlutterLogo(),
                      title: const Text('ListTile'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
