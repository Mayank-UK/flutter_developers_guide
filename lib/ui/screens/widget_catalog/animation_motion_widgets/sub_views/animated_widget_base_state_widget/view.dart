import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AnimatedWidgetBaseStateWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'AnimatedWidgetBaseState',
      markdownPath: 'assets/markdowns/widget_catalog/animation_motion/animated_widget_base_state_markdown.md',
      preview: _AnimatedWidgetBaseStateImplementation(),
    );
  }
}

class _AnimatedWidgetBaseStateImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'ImplicitlyAnimatedWidgetState is the State base class behind every "AnimatedX" implicit-animation widget — AnimatedContainer, AnimatedAlign, AnimatedOpacity and friends. It runs a single forward AnimationController each time a property changes and drives a tween from the old value to the new one.',
            ),
            TextBlock(
              'You rarely touch it directly: app code uses the AnimatedX widgets, and they internally lean on this state to start and stop the implicit animation. Subclass it only if you are authoring your own ImplicitlyAnimatedWidget with a custom interpolable property.',
            ),
          ],
        ),
      ],
    );
  }
}
