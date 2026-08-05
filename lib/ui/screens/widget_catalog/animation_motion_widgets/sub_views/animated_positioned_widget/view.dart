import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AnimatedPositionedWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'AnimatedPositioned',
      markdownPath: 'assets/markdowns/widget_catalog/animation_motion/animated_positioned_markdown.md',
      preview: _AnimatedPositionedImplementation(),
    );
  }
}

class _AnimatedPositionedImplementation extends StatefulWidget {
  @override
  __AnimatedPositionedImplementationState createState() =>
      __AnimatedPositionedImplementationState();
}

class __AnimatedPositionedImplementationState
    extends State<_AnimatedPositionedImplementation> {
  bool _isToggled = false;

  void onPressed() {
    setState(() {
      this._isToggled = !this._isToggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'AnimatedPositioned is the implicit-animation version of Positioned: change its top/left/right/width/height in setState and it tweens the child to the new rectangle inside its Stack over `duration`. It only works as a direct child of a Stack, just like Positioned.',
            ),
            TextBlock(
              'Because every rebuild with a new rectangle kicks off an animation, it suits discrete state changes (snapping between two layouts). For continuous motion driven by a gesture or controller, use PositionedTransition or a Sliver/sized child driven by an AnimationController so you control every frame.',
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          width: this._isToggled ? 200.0 : 50.0,
                          height: this._isToggled ? 50.0 : 200.0,
                          top: this._isToggled ? 150.0 : 50.0,
                          duration: const Duration(seconds: 2),
                          curve: Curves.fastOutSlowIn,
                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: this.onPressed,
                    child: Text('Tap to toggle animation'),
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
