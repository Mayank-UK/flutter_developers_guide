import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class GestureDetectorWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'GestureDetector',
      markdownPath: 'assets/markdowns/widget_catalog/interactive/gesture_detector_markdown.md',
      preview: _GestureDetectorWidgetImplementation(),
    );
  }
}

class _GestureDetectorWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'GestureDetector recognizes taps, double-taps, long-presses, pans, scales, and drags, firing the callback for each recognized gesture. It is the most common way to make an otherwise non-interactive widget (a Container, Image, or custom box) respond to touch.',
            ),
            TextBlock(
              'It participates in the gesture arena, so competing gestures (your tap vs. a parent\'s pan) are reconciled automatically. With a child it sizes to that child; without one it fills its parent, which is handy for full-area tap targets. For richer hit details (position, velocity) use the listener callbacks or reach for InkWell when you want Material ripple feedback on taps.',
            ),
            Container(
              child: GestureDetector(
                onTap: () {
                  final SnackBar snackBar =
                      SnackBar(content: const Text('Click/tap registered'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.amber,
                  height: 100,
                  padding: const EdgeInsets.all(16),
                  width: 200,
                  child: Text(
                    'Tap anywhere on this container',
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
