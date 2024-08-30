import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class DrawerWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/drawer_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Drawer',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _DrawerWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _DrawerWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"Drawer" widget by default works inside "Scaffold" widget, "AppBar" widget automatically creates a hamburger menu when a drawer is specifies in "Scaffold" widget.',
            ),
            TextBlock(
              '"DrawerHeader" widget is used inside "Drawer" widget to specify a drawer header.',
            ),
            Container(
              height: 500,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('AppBar'),
                ),
                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      DrawerHeader(
                        child: Text('Drawer Header'),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                      ),
                      ListTile(
                        title: Text('Item 1'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('Item 2'),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
