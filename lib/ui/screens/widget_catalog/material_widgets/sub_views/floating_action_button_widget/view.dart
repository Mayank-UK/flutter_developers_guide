import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class FloatingActionButtonWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'FloatingActionButton',
      markdownPath: 'assets/markdowns/widget_catalog/material/floating_action_button_markdown.md',
      preview: _FloatingActionButtonWidgetImplementation(),
    );
  }
}

class _FloatingActionButtonWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'FloatingActionButton (FAB) is a circular, elevated Material button that hovers above the content to promote the screen\'s single most important affirmative action — typically "Add", "Compose", or "New". It is normally placed on Scaffold.floatingActionButton so the Scaffold positions and animates it for you.',
            ),
            TextBlock(
              'It is intentionally prominent: a FAB screams "tap me next". Use exactly one per screen (rarely two), and only for an action that is unambiguously the primary one. If the action is secondary or contextual, an AppBar action or a normal button is the right choice.',
            ),
            TextBlock(
              'Tip: FloatingActionButton.extended gives you a wider pill-shaped variant that fits an icon plus a text label — better than a cryptic icon-only FAB when the action is uncommon.',
            ),
            Container(
              child: FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
