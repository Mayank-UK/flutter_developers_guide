import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AnimatedSizeWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'AnimatedSize',
      markdownPath: 'assets/markdowns/widget_catalog/animation_motion/animated_size_markdown.md',
      preview: _AnimatedSizeImplementation(),
    );
  }
}

class _AnimatedSizeImplementation extends StatefulWidget {
  @override
  __AnimatedSizeImplementationState createState() =>
      __AnimatedSizeImplementationState();
}

class __AnimatedSizeImplementationState
    extends State<_AnimatedSizeImplementation>
    with SingleTickerProviderStateMixin {
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
              'AnimatedSize watches its child\'s intrinsic size and smoothly grows or shrinks to fit whenever that size changes between rebuilds, over `duration` and `curve`. It\'s the implicit way to animate layout changes — a child swaps from small to large and the parent eases to the new footprint instead of snapping.',
            ),
            TextBlock(
              'It needs a vsync (typically the surrounding State via SingleTickerProviderStateMixin) since it manages an internal controller. Wrap a single child; if you have multiple widgets whose sizes should animate together, give each its own AnimatedSize or reach for an explicit SizeTransition.',
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedSize(
                    curve: Curves.easeIn,
                    duration: const Duration(
                      seconds: 1,
                    ),
                    child: FlutterLogo(
                      size: _isToggled ? 24 : 64,
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
