import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class TextView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Text',
      markdownPath: 'assets/markdowns/ui/ui_manipulation/text_markdown.md',
      preview: _TextImplementation(),
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
            TextBlock(
              'Font size is controlled through "Text.style", which accepts a "TextStyle". The "fontSize" parameter is a logical pixel value that scales with the device text scale factor unless "textScaleFactor" is forced.',
            ),
            TextBlock(
              'For consistent typography prefer reading a named style from "Theme.of(context).textTheme" (e.g. "titleLarge", "bodyMedium") rather than scattering raw numbers, so every label tracks the app-wide type scale.',
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
            TextBlock(
              'Text color is set with "TextStyle.color". Pass a "Color" directly or use "Theme.of(context).colorScheme" tokens so the same string reads correctly in both light and dark mode.',
            ),
            TextBlock(
              'Always check contrast: with a colored background (like the amber box below) the foreground must stay above the WCAG threshold. "Color.withOpacity" can drop contrast faster than you\'d expect, so verify the result.',
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
            TextBlock(
              'The "fontStyle" parameter switches between "FontStyle.normal" and "FontStyle.italic". Italic text is synthesized from the regular face if no italic glyph set is bundled.',
            ),
            TextBlock(
              'For real italic and oblique variants, ship the corresponding .ttf in pubspec and reference it via "fontFamily" together with a "fontStyle"; otherwise the engine slants the regular font, which looks noticeably worse.',
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
            TextBlock(
              'Use "TextStyle.fontWeight" with a "FontWeight" value (w100 through w900, plus named shortcuts like "bold"). The rendered weight depends on which faces the bundled font actually provides.',
            ),
            TextBlock(
              'Tip: "FontWeight.normal" (w400) and "FontWeight.bold" (w700) are universally available; intermediate weights only render distinctly when the font family ships them, otherwise Flutter picks the nearest supported face.',
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
            TextBlock(
              '"TextStyle.fontFamily" selects the typeface by name. The font must be declared under the "fonts:" section of "pubspec.yaml" (or come from a package) before it can be referenced here.',
            ),
            TextBlock(
              'For multi-weight families, pair "fontFamily" with a matching "fontFamilyFallback" list so a missing glyph (e.g. emoji or CJK) falls through to a font that has it instead of showing tofu boxes.',
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
