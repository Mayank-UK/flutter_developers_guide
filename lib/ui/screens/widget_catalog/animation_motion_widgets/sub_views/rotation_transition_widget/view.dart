import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class RotationTransitionWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'RotationTransition',
      markdownPath: 'assets/markdowns/widget_catalog/animation_motion/rotation_transition_markdown.md',
      preview: _RotationTransitionImplementation(),
    );
  }
}

class _RotationTransitionImplementation extends StatefulWidget {
  @override
  __RotationTransitionImplementationState createState() =>
      __RotationTransitionImplementationState();
}

class __RotationTransitionImplementationState
    extends State<_RotationTransitionImplementation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
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
              'RotationTransition rotates its child by the number of turns given by an Animation<double> — 1.0 equals one full revolution. Feed it a CurvedAnimation to shape the easing, and reuse one controller across multiple transitions to keep them synchronized.',
            ),
            TextBlock(
              'It is the explicit-animation counterpart to a Transform.rotate driven by an animation, packaged so you don\'t have to wire AnimatedBuilder yourself. Pair it with FadeTransition or ScaleTransition on the same controller for combined enter/exit motion.',
            ),
            Container(
              child: RotationTransition(
                turns: CurvedAnimation(
                  parent: _controller,
                  curve: Curves.elasticOut,
                ),
                child: FlutterLogo(
                  size: 64,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
