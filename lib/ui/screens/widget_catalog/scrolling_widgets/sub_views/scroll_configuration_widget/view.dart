import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ScrollConfigurationWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'ScrollConfiguration',
      markdownPath: 'assets/markdowns/widget_catalog/scrolling/scroll_configuration_markdown.md',
      preview: _ScrollConfigurationWidgetImplementation(),
    );
  }
}

class _ScrollConfigurationWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'ScrollConfiguration controls how Scrollable widgets behave across a subtree — which ScrollPhysics they use, how overscroll looks, and the default scrolling gestures. It\'s the seam through which platform conventions (iOS bounce vs. Android glow/clamping) are applied.',
            ),
            TextBlock(
              'Wrap a subtree to override the inherited behavior for everything below: pass behavior: ScrollConfiguration.of(context).copyWith(physics: ...) to swap physics while keeping the rest, or set a fresh MaterialPlatform/Cupertino style. It\'s how you make a single iOS-style bouncing list inside an otherwise Android app.',
            ),
          ],
        ),
      ],
    );
  }
}
