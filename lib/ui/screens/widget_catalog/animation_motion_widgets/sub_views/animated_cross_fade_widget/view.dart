import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AnimatedCrossFadeWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'AnimatedCrossFade',
      markdownPath: 'assets/markdowns/widget_catalog/animation_motion/animated_cross_fade_markdown.md',
      preview: _AnimatedCrossFadeImplementation(),
    );
  }
}

class _AnimatedCrossFadeImplementation extends StatefulWidget {
  @override
  __AnimatedCrossFadeImplementationState createState() =>
      __AnimatedCrossFadeImplementationState();
}

class __AnimatedCrossFadeImplementationState
    extends State<_AnimatedCrossFadeImplementation> {
  bool isToggled = false;

  void onPressed() {
    setState(() {
      isToggled = !isToggled;
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
              'AnimatedCrossFade blends between two children: drive crossFadeState between showFirst and showSecond and the first child dissolves into the second while the box animates between their sizes. Use it for state-driven swaps — toggling between an expanded and collapsed layout, or an icon that morphs between two glyphs.',
            ),
            TextBlock(
              'Both children stay mounted during the fade so their state is preserved; if you want a hard cut or a directional transition use the Transition widgets (FadeTransition, SizeTransition) with an AnimationController instead. Set layoutBuilder to control how the two sizes are aligned during the cross-fade.',
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: AnimatedCrossFade(
                      duration: const Duration(seconds: 3),
                      firstChild: const FlutterLogo(
                          style: FlutterLogoStyle.horizontal, size: 100.0),
                      secondChild: const FlutterLogo(
                          style: FlutterLogoStyle.stacked, size: 100.0),
                      crossFadeState: this.isToggled
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: this.onPressed,
                    child: Text('Animate cross fade'),
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
