import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class TabBarWidgetView extends StatelessWidget {
  final String _appBarTitle = 'TabBar';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/tab_bar_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _TabBarWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _TabBarWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"TabBar" widget has named parameters like indicator, indicatorColor, padding, tabs, etc, which specify the TabBar behavior.',
            ),
            TextBlock(
              '"TabBar" widget define it\'s tabs using "Tab" widget.',
            ),
            TextBlock(
              'For custom tabBar behavior use "TabController" class.',
            ),
            Container(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Container(
                      color: Colors.blueGrey,
                      child: TabBar(
                        indicatorColor: Colors.black,
                        tabs: [
                          Tab(icon: Icon(Icons.directions_car)),
                          Tab(icon: Icon(Icons.directions_transit)),
                          Tab(icon: Icon(Icons.directions_bike)),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      height: 200,
                      child: TabBarView(
                        children: [
                          Icon(Icons.directions_car),
                          Icon(Icons.directions_transit),
                          Icon(Icons.directions_bike),
                        ],
                      ),
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
