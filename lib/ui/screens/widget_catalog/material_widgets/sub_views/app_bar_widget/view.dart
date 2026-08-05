import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AppBarWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'AppBarView',
      markdownPath: 'assets/markdowns/widget_catalog/material/app_bar_markdown.md',
      preview: _AppBarWidgetImplementation(),
    );
  }
}

class _AppBarWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'AppBar is the top navigation bar in a Material Scaffold. It hosts the screen title, the back button, leading icon actions (drawer menu, back navigation), and trailing actions on the right via the actions: list.',
            ),
            TextBlock(
              'It automatically wires up platform conventions — back button appearance, hamburger menu icon when a drawer is set on the Scaffold, and theme-driven colors/elevation — so you rarely need to build a custom top bar.',
            ),
            TextBlock(
              'Gotcha: for a top bar that must collapse, stretch, or pin while the body scrolls, reach for SliverAppBar inside a CustomScrollView instead — a plain AppBar cannot animate with the scroll.',
            ),
            Container(
              child: AppBar(
                title: Text('AppBar'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
