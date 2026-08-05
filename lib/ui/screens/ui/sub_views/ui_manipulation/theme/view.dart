import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ThemeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Theme',
      markdownPath: 'assets/markdowns/ui/ui_manipulation/theme_markdown.md',
      preview: _ThemeImplementation(),
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
            TextBlock(
              'The "Theme" widget injects a local "ThemeData" that overrides the ambient theme for its subtree only. Use it to give one section (or a single widget like the FAB below) a different palette without affecting the rest of the app.',
            ),
            TextBlock(
              'Descendants read the override through "Theme.of(context)", so no prop drilling is needed. For small color swaps prefer "ColorScheme.fromSeed" or "copyWith" so the rest of the inherited theme stays intact.',
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
            TextBlock(
              'App-wide theming lives on the root widget: "MaterialApp.theme" takes a "ThemeData" that every descendant inherits through "Theme.of(context)". Define "colorScheme", "textTheme", and component themes once and they propagate everywhere.',
            ),
            TextBlock(
              'Tip: also pass "darkTheme" and let "themeMode" follow the system; you then have one source of truth that flips with OS dark mode, with no "MediaQuery.platformBrightness" checks scattered through widget code. A live demo isn\'t embeddable here because only one "MaterialApp" exists per app.',
            ),
          ],
        ),
      ],
    );
  }
}
