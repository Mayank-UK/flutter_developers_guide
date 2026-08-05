import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ClipOvalWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'ClipOval',
      markdownPath: 'assets/markdowns/widget_catalog/painting_effects/clip_oval_markdown.md',
      preview: _ClipOvalWidgetImplementation(),
    );
  }
}

class _ClipOvalWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'ClipOval crops its child into an oval — a circle when the child is square, an ellipse otherwise — hiding anything outside the shape. Use it for circular avatars, pill-shaped chips, or any "rounded all the way" silhouette the child doesn\'t already have.',
            ),
            TextBlock(
              'Clipping is a paint-time effect, not layout: the child still measures and hit-tests in its original rectangle. When all you need is a circular color or gradient, a BoxDecoration with shape: BoxShape.circle achieves the same look more cheaply than clipping a rectangular child.',
            ),
            Container(
              color: Colors.amber,
              padding: const EdgeInsets.all(8),
              child: ClipOval(
                child: Container(
                  color: Colors.red,
                  height: 80,
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
