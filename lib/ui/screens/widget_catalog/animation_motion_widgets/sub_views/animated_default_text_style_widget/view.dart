import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AnimatedDefaultTextStyleWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'AnimatedDefaultTextStyle',
      markdownPath: 'assets/markdowns/widget_catalog/animation_motion/animated_default_text_style_markdown.md',
      preview: _AnimatedDefaultTextStyleWidgetImplementatio(),
    );
  }
}

class _AnimatedDefaultTextStyleWidgetImplementatio extends StatefulWidget {
  @override
  __AnimatedDefaultTextStyleWidgetImplementatioState createState() =>
      __AnimatedDefaultTextStyleWidgetImplementatioState();
}

class __AnimatedDefaultTextStyleWidgetImplementatioState
    extends State<_AnimatedDefaultTextStyleWidgetImplementatio> {
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
              'AnimatedDefaultTextStyle is the implicit-animation version of DefaultTextStyle: when you change the TextStyle it passes to descendants, it tweens fontSize, color, weight, and other interpolable properties over `duration` instead of snapping. Every descendant Text that inherits the style animates with it.',
            ),
            TextBlock(
              'Use it for state-driven typography transitions — a headline that grows when selected, copy that recolors on toggle. Properties that can\'t be interpolated (like switching fontFamily) will cross-fade as best they can; for fully custom text transitions drive a Text widget with an explicit AnimationController instead.',
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: this.isToggled
                          ? TextStyle(fontSize: 30)
                          : TextStyle(fontSize: 50),
                      child: Text('Flutter'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: this.onPressed,
                    child: Text('Animated text style'),
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
