import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AnimatedModalBarrierWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'AnimatedModalBarrier',
      markdownPath: 'assets/markdowns/widget_catalog/animation_motion/animated_modal_barrier_markdown.md',
      preview: _AnimatedModalBarrierImplementation(),
    );
  }
}

class _AnimatedModalBarrierImplementation extends StatefulWidget {
  @override
  __AnimatedModalBarrierImplementationState createState() =>
      __AnimatedModalBarrierImplementationState();
}

class __AnimatedModalBarrierImplementationState
    extends State<_AnimatedModalBarrierImplementation>
    with SingleTickerProviderStateMixin {
  bool _isToggled = false;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
    );
  }

  void onPressed() {
    setState(() {
      this._isToggled = !this._isToggled;
    });

    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'AnimatedModalBarrier is a ModalBarrier whose color is driven by an Animation<Color>, so the scrim can fade or shift hue over time. Like ModalBarrier, it blocks interaction with widgets behind it — handy for building custom modal overlays where the darkening backdrop should animate in and out.',
            ),
            TextBlock(
              'Feed `color` a ColorTween.animate(controller) to drive the transition, and set dismissible to control whether tapping the barrier pops it. For most apps the standard showDialog routes provide this behavior out of the box — reach for AnimatedModalBarrier when you are hand-rolling a custom dialog or bottom-sheet stack.',
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100.0,
                    width: 250.0,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: this.onPressed,
                          child: Text('Tap to toggle modal barrier'),
                        ),
                        this._isToggled
                            ? AnimatedModalBarrier(
                                color: ColorTween(
                                  begin: Color.fromARGB(100, 255, 255, 255),
                                  end: Color.fromARGB(100, 127, 127, 127),
                                ).animate(_animationController),
                                dismissible: false,
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: this.onPressed,
                    child: Text('Tap to toggle modal barrier'),
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
