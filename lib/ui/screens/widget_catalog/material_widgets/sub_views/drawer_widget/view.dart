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
              'Drawer is a Material panel that slides in horizontally from the screen edge, exposing navigation links and menus. It is set on Scaffold.drawer (left edge) or Scaffold.endDrawer (right edge), and the Scaffold/AppBar pair automatically wires up the hamburger icon that opens it.',
            ),
            TextBlock(
              'Inside it you typically place a ListView so the contents scroll, a DrawerHeader (or UserAccountsDrawerHeader) at the top for branding/account context, and a list of ListTile destinations that navigate and then close the drawer via Navigator.pop.',
            ),
            TextBlock(
              'Tip: on tablets and desktops, Material guidelines recommend a permanent navigation rail instead of a drawer — drawers hide destination options behind a tap, which hurts discoverability on larger screens.',
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
