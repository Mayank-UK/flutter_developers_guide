import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class FractionalTranslationWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'FractionalTranslation',
      markdownPath: 'assets/markdowns/widget_catalog/painting_effects/fractional_translation_markdown.md',
      preview: _FractionalTranslationWidgetImplementation(),
    );
  }
}

class _FractionalTranslationWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'FractionalTranslation offsets its child by a fraction of the child\'s own box size — Offset(0.5, 0) slides it half its width to the right. Use it when an offset should scale with the child\'s dimensions, like sliding a widget by "one full width" without first measuring it.',
            ),
            TextBlock(
              'It affects painting only, not layout, so siblings still see the original box. For a fixed-pixel offset prefer Transform.translate or Padding; reach for FractionalTranslation specifically when the ratio of the child\'s size is what you want to express.',
            ),
            Container(
              color: Colors.amber,
              child: FractionalTranslation(
                translation: Offset(0.5, 0),
                child: Text(
                  "Hello world",
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
