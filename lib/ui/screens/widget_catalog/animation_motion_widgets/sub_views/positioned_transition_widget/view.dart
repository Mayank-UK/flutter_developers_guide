import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class PositionedTransitionWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'PositionedTransition',
      markdownPath: 'assets/markdowns/widget_catalog/animation_motion/positioned_transition_markdown.md',
      preview: _PositionedTransitionImplementation(),
    );
  }
}

class _PositionedTransitionImplementation extends StatefulWidget {
  @override
  __PositionedTransitionImplementationState createState() =>
      __PositionedTransitionImplementationState();
}

class __PositionedTransitionImplementationState
    extends State<_PositionedTransitionImplementation>
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
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'PositionedTransition is the explicit-animation version of Positioned: drive its `rect` with a RelativeRectTween and it animates the child\'s position and size inside a Stack along your AnimationController. Unlike AnimatedPositioned, you own the timeline, so it fits a choreographed sequence.',
            ),
            TextBlock(
              'Build the tween with RelativeRectTween (not a plain Rect) so the rect is expressed relative to the Stack — the same widget animates correctly across different parent sizes. It must sit inside a Stack, like Positioned itself.',
            ),
            Container(
              height: 400,
              child: Stack(
                children: [
                  PositionedTransition(
                    rect: RelativeRectTween(
                      begin: RelativeRect.fromSize(
                        Rect.fromLTWH(0, 0, 64, 64),
                        Size(64, 64),
                      ),
                      end: RelativeRect.fromSize(
                        Rect.fromLTWH(50, 50, 32, 32),
                        Size(32, 32),
                      ),
                    ).animate(
                      CurvedAnimation(
                        parent: _controller,
                        curve: Curves.easeInOut,
                      ),
                    ),
                    child: FlutterLogo(
                      size: 64,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
