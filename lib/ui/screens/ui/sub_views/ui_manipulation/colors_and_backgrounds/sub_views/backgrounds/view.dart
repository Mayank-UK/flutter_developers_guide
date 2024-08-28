import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';

class BackgroundsView extends StatelessWidget {
  final String _appBarTitle = 'Backgrounds';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/colors_backgrounds/background_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _BackgroundImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _BackgroundImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Particular element\'s background using "Container" widget',
          content: [
            Container(
              child: Text(
                  '"Container" widget has a named parameter "color", which takes a value for color.\nUse the "Color" enum for using pre specified material theme colors.'),
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.amber,
              height: 100,
              width: 100,
              child: const Text('text'),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Whole page background using  "Scaffold" widget',
          content: [
            Container(
              child: Text(
                  '"Scaffold" widget has a named parameter "backgroundColor", which takes a value for color\nUse the "Color" enum for using pre specified material theme colors.'),
            ),
            Container(
              child: Text(
                  'Example implementation can not be shown here as there can be only one "Scaffold" widget on a page.'),
            ),
          ],
        ),
        SectionWrapper(
          title:
              'Whole application background using using "MaterialApp" widget',
          content: [
            Container(
              child: Text(
                  '"MaterialApp" widget has a named parameter "theme", which takes an object of "ThemeData" class, which in turn has a named parameter "scaffoldBackgroundColor" that takes a value for color. \nUse the "Color" enum for using pre specified material theme colors.'),
            ),
            Container(
              child: Text(
                  'Example implementation can not be shown here as there can be only one "MaterialApp" widget in an application.'),
            ),
          ],
        ),
      ],
    );
  }
}
