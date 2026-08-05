import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';
import '../../../../../../../components/text_block.dart';

class ColorsView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/colors_backgrounds/text_color_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Text Color',
      mobileUi: [
        CodePreviewTabs(
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
            TextBlock(
              'The most local way to color text is the "Text" widget\'s "style" parameter, which accepts a "TextStyle". Setting "color" there overrides any inherited style for that one node only.',
            ),
            TextBlock(
              'For one-off accents reach for the "Colors" enum; for anything reused, prefer "Theme.of(context)" tokens (e.g. "colorScheme.primary", "textTheme.bodyLarge") so the look follows light/dark mode automatically.',
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
            TextBlock(
              '"DefaultTextStyle" injects a "TextStyle" that every descendant "Text" inherits unless it overrides it, so you can recolor an entire branch of the tree from one place.',
            ),
            TextBlock(
              'It merges its style with whatever the ambient "Theme" already provides, so child widgets keep font family and size while adopting the new color.',
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
            TextBlock(
              'For app-wide consistency, set text styles on the "MaterialApp.theme" parameter via "ThemeData.textTheme". Every widget that reads "Theme.of(context).textTheme" then resolves to those values, with no hard-coded colors in widget code.',
            ),
            TextBlock(
              'Tip: define both a light and a dark "ThemeData" (the "darkTheme" parameter) so text color adapts correctly when the OS switches modes — only the theme source changes, the widget tree stays identical.',
            ),
          ],
        ),
      ],
    );
  }
}
