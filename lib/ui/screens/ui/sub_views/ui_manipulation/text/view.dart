import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';

class TextView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/text_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Text',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _TextImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _TextImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Font size',
          content: [
            Container(
              child: Text(
                  'Text size can be changed using "Text" widget\'s named parameter "style" which takes an object of "TextStyle" class.'),
            ),
            Container(
              child: Text(
                  '"TextStyle" object takes a named parameter "fontSize", which takes an integer value.'),
            ),
            Container(
              color: Colors.amber,
              padding: EdgeInsets.all(8),
              child: Text(
                'Sample text of size 20',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Font color',
          content: [
            Container(
              child: Text(
                  'Text size can be changed using "Text" widget\'s named parameter "style" which takes an object of "TextStyle" class.'),
            ),
            Container(
              child: Text(
                  '"TextStyle" object takes a named parameter "color", which takes an object of "Color" class or you can also use predefined colors from material UI using "Colors" enum.'),
            ),
            Container(
              color: Colors.amber,
              padding: EdgeInsets.all(8),
              child: Text(
                'Sample text with red color',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Font style',
          content: [
            Container(
              child: Text(
                  'Text size can be changed using "Text" widget\'s named parameter "style" which takes an object of "TextStyle" class.'),
            ),
            Container(
              child: Text(
                  '"TextStyle" object takes a named parameter "fontStyle", which takes a value predefined in "FontStyle" enum.'),
            ),
            Container(
              color: Colors.amber,
              padding: EdgeInsets.all(8),
              child: Text(
                'Sample text italic font style',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Font weight',
          content: [
            Container(
              child: Text(
                  'Text size can be changed using "Text" widget\'s named parameter "style" which takes an object of "TextStyle" class.'),
            ),
            Container(
              child: Text(
                  '"TextStyle" object takes a named parameter "fontWeight", which takes a value predefined in "FontWeight" enum.'),
            ),
            Container(
              color: Colors.amber,
              padding: EdgeInsets.all(8),
              child: Text(
                'Sample text bold weight',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Font family',
          content: [
            Container(
              child: Text(
                  'Text size can be changed using "Text" widget\'s named parameter "style" which takes an object of "TextStyle" class.'),
            ),
            Container(
              child: Text(
                  '"TextStyle" object takes a named parameter "fontFamily", which takes a final String value for font family, the fonts should be first defined in "pubspec.yaml" file before using them here.'),
            ),
            Container(
              color: Colors.amber,
              padding: EdgeInsets.all(8),
              child: Text(
                'Sample text with "Roboto-Light"',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto-Light',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
