import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';

class ColorsView extends StatelessWidget {
  final String _appBarTitle = 'Text Color';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/colors_backgrounds/text_color_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      mobileUi: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _ColorsImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ColorsImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Particular text element color using "Text" widget',
          content: [
            Container(
              child: Text(
                  '"Text" widget has a named parameter "style" which takes an object of "TextStyle" class. \nUse the "Color" enum for using pre specified material theme colors.'),
            ),
            Container(
              child: Text(
                'Text',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Whole section text color using "DefaultTextStyle" widget',
          content: [
            Container(
              child: Text(
                  '"DefaultTextStyle" widget has a named parameter "style" which takes an object of "TextStyle" class. \nUse the "Color" enum for using pre specified material colors.'),
            ),
            Container(
              child: DefaultTextStyle(
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
                child: Text(
                  'Text',
                ),
              ),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Whole application text color using "MaterialApp" widget',
          content: [
            Container(
              child: Text(
                  '"MaterialApp" widget has a named parameter "theme" which takes an object of "ThemeData" class.'),
            ),
          ],
        ),
      ],
    );
  }
}
