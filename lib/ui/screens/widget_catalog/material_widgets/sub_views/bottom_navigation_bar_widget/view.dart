import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class BottomNavigationBarWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/bottom_navigation_bar_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'BottomNavigationBar',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _BottomNavigationBarWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _BottomNavigationBarWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"BottomNavigationBar" widget has named parameter items, which takes a list of "BottomNavigationBarItem", which in turn has named parameters icon and title to specify the item.',
            ),
            Container(
              child: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.ac_unit,
                    ),
                    label: 'item_1',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.ac_unit,
                    ),
                    label: 'item_2',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.ac_unit,
                    ),
                    label: 'item_3',
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
