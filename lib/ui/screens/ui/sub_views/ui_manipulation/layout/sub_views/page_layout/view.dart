import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';

class PageLayoutView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/layout/application_page_layout_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Application and page layout',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _PageLayoutImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _PageLayoutImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'General information',
          content: [
            Container(
              child: Text(
                  'There are 2 main widgets which are used at the root(main.dart) of most flutter applications, "MaterialApp" for android and "Cupertino" for ios. Although it is perfectly normal to not use these widgets and have your own custom styling.'),
            ),
            Container(
              child: Text(
                  'Every page has it\'s own "Scaffold" widget which gives structure to a page like appBar, drawer, etc.'),
            ),
            Container(
              child: Text(
                  'To use any widget in your flutter file including the above mentioned widgets, you have to import either "widgets" package, or "material" package, or "cupertino" package.'),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Using "MaterialApp" at root(main.dart)',
          content: [
            Container(
              child: Text(
                  'Material is a design system developed by google for it\'s android operating system.'),
            ),
            Container(
              child: Text(
                  '"MaterialApp" widget has named parameters "home", which takes "Scaffold" widget as a value. It also has other named parameters for routes, themes, etc.'),
            ),
            Container(
              child: Text(
                  '"Scaffold" widget has named parameters "appBar", "drawer", and "body" which takes "appBar", "drawer" and other widgets for "body" as a value.'),
            ),
            Container(
              child: Text(
                  'Import the material package from the flutter library to use it.'),
            )
          ],
        ),
        SectionWrapper(
          title: 'Using "CupertinoApp" at root(main.dart)',
          content: [
            Container(
              child: Text(
                  'Cupertino is a design system developed by apple for it\'s ios operating system.'),
            ),
            Container(
              width: double.infinity,
              child: const Text('_'),
            )
          ],
        ),
      ],
    );
  }
}
