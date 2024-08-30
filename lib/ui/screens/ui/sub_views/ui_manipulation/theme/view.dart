import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';

class ThemeView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/theme_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Theme',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _ThemeImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ThemeImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Using "Theme" widget',
          content: [
            Container(
              child: Text(
                  '"Theme" widget provides a mechanism to supply the different styles like typography, colors, etc at one place and use them at many places without defining them again and again.'),
            ),
            Container(
              child: Text(
                  '"Theme" widget has a named parameter "data", which takes an object of "ThemeData" class.'),
            ),
            Wrap(
              runSpacing: 8,
              spacing: 8,
              children: <Widget>[
                Wrap(
                  direction: Axis.vertical,
                  runSpacing: 8,
                  spacing: 8,
                  children: <Widget>[
                    Text(
                      'Default',
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
                Wrap(
                  direction: Axis.vertical,
                  runSpacing: 8,
                  spacing: 8,
                  children: <Widget>[
                    Text(
                      'Themed',
                    ),
                    Theme(
                      data: ThemeData(
                        hintColor: Colors.yellow,
                      ),
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SectionWrapper(
          title: 'Using "MaterialApp" or "CupertinoApp" widget',
          content: [
            Container(
              child: Text(
                  '"MaterialApp" widget has a named parameter "theme", which takes an object of "ThemeData" class. This can be used to define and supply styles for typography, colors, etc, throughout the application.'),
            ),
            Container(
              child: Text(
                  'Since there can be only one "MaterialApp" widget in an application, so an implemented example is not available.'),
            ),
          ],
        ),
      ],
    );
  }
}
