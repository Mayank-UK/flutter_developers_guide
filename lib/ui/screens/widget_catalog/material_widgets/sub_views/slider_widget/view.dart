import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class SliderWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Slider',
      markdownPath: 'assets/markdowns/widget_catalog/material/slider_markdown.md',
      preview: _SliderWidgetImplementation(),
    );
  }
}

class _SliderWidgetImplementation extends StatefulWidget {
  @override
  __SliderWidgetImplementationState createState() =>
      __SliderWidgetImplementationState();
}

class __SliderWidgetImplementationState
    extends State<_SliderWidgetImplementation> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Slider is a Material control that lets the user pick a numeric value from a continuous (or discrete) range by dragging a thumb along a horizontal track. Set min, max, and value; receive the new value through onChanged as the user drags.',
            ),
            TextBlock(
              'Add divisions to snap to discrete steps and a label to surface the current value in a tooltip bubble above the thumb. Sliders are ideal for adjustable-but-imprecise settings — volume, brightness, a percentage — where the user cares more about "more / less" than an exact number.',
            ),
            TextBlock(
              'Tip: for a single on/off or two-state choice, a Switch is clearer than a Slider pinned to 0 and 1. Sliders shine when the value has a meaningful gradient between the endpoints.',
            ),
            Container(
              child: Slider(
                value: _currentSliderValue,
                min: 0,
                max: 100,
                divisions: 5,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
