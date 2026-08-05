import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../../../components/section_wrapper.dart';
import '../../../../../../../components/text_block.dart';

class BackgroundsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Backgrounds',
      markdownPath: 'assets/markdowns/ui/ui_manipulation/colors_backgrounds/background_markdown.md',
      preview: _BackgroundImplementation(),
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
            TextBlock(
              'The most local way to paint a background behind a single widget is "Container.color", which fills the container\'s box with a solid "Color". For gradients, images, or rounded backgrounds, switch to "Container.decoration" with a "BoxDecoration" instead.',
            ),
            TextBlock(
              'Tip: you may set either "color" or "decoration" on a "Container", never both — the framework asserts. Prefer "Theme.of(context).colorScheme" tokens over raw "Colors" so the look tracks light/dark mode.',
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
            TextBlock(
              'The "Scaffold.backgroundColor" parameter paints the background of one entire page. It overrides the app-wide setting for just this route, so individual screens can carry their own canvas color.',
            ),
            TextBlock(
              'A live demo cannot be embedded here because only one "Scaffold" is rendered per page; in practice you would set it on the screen\'s own "Scaffold" rather than nesting one inside the demo.',
            ),
          ],
        ),
        SectionWrapper(
          title:
              'Whole application background using using "MaterialApp" widget',
          content: [
            TextBlock(
              'For a default background across the app, set "ThemeData.scaffoldBackgroundColor" on the "MaterialApp.theme". Every "Scaffold" without an explicit background then resolves to this color.',
            ),
            TextBlock(
              'Tip: provide a matching "darkTheme" so the canvas swaps with the OS theme. A live demo is not possible here since there is only one "MaterialApp" in an application.',
            ),
          ],
        ),
      ],
    );
  }
}
