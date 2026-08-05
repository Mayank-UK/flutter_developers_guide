import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class FadeTransitionWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'FadeTransition',
      markdownPath: 'assets/markdowns/widget_catalog/animation_motion/fade_transition_markdown.md',
      preview: _FadeTransitionImplementation(),
    );
  }
}

class _FadeTransitionImplementation extends StatefulWidget {
  @override
  __FadeTransitionImplementationState createState() =>
      __FadeTransitionImplementationState();
}

class __FadeTransitionImplementationState
    extends State<_FadeTransitionImplementation> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'FadeTransition drives its child\'s opacity from an Animation<double>, rebuilding only the opacity each frame as the controller ticks. It is the explicit-animation counterpart to AnimatedOpacity — reach for it when the fade is part of a larger controller-driven sequence rather than a one-off state change.',
            ),
            TextBlock(
              'Wrap the opacity in a CurvedAnimation to shape the easing, and reuse the same controller across multiple transitions (fade + slide, for instance) so they stay in lockstep. Because it uses the transition layer rather than a save-layer per Opacity widget, it composes well inside page-route builders.',
            ),
            Container(
              child: FadeTransition(
                opacity: CurvedAnimation(
                  parent: _controller,
                  curve: Curves.easeIn,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: FlutterLogo(
                    size: 64,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
