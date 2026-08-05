import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class TransformWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Transform',
      markdownPath: 'assets/markdowns/widget_catalog/layout/transform_markdown.md',
      preview: _TransformWidgetImplementation(),
    );
  }
}

class _TransformWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Transform applies a Matrix4 transformation — translate, scale, rotate, skew — to its child before painting, without changing the child\'s layout or hit-testing rectangle. Convenience constructors (Transform.translate, Transform.rotate, Transform.scale) build the matrix for you.',
            ),
            TextBlock(
              'Use it for visual effects: tilting a card, rotating an icon, animating a hover. Because Transform only affects paint, layout uses the original bounds — that is usually what you want for animations, but if you need hit-testing to follow the visual transform set transformHitTests to true.',
            ),
            Container(
              child: Transform(
                transform: Matrix4.skewY(0.1),
                child: Container(
                  color: Colors.amber,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
