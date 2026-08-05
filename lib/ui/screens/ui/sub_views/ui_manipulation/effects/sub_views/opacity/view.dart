import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../../../components/section_wrapper.dart';
import '../../../../../../../components/text_block.dart';

class OpacityView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Opacity',
      markdownPath: 'assets/markdowns/ui/ui_manipulation/effects/opacity_markdown.md',
      preview: _OpacityImplementation(),
    );
  }
}

class _OpacityImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Using "Container" widget',
          content: [
            TextBlock(
              'For a single solid color, the cheapest way to make it translucent is to bake the alpha into the "Color" itself — either via the 8-digit hex code (ARGB) or with "Color.withOpacity". This avoids an extra widget layer in the tree.',
            ),
            TextBlock(
              'Use this approach when only one image or color needs compositing; the alpha is rendered as part of the paint and skips the offscreen layer that the "Opacity" widget has to allocate.',
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing: 8,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  color: Color(0xFF0E3311),
                  height: 100,
                  padding: EdgeInsets.all(8),
                  width: 100,
                  child: Text(
                    'Without opacity',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  color: Color(0xFF0E3311).withValues(alpha: 0.5),
                  height: 100,
                  padding: EdgeInsets.all(8),
                  width: 100,
                  child: Text(
                    'With opacity',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
        SectionWrapper(
          title: 'Using "Opacity" widget',
          content: [
            TextBlock(
              'The "Opacity" widget applies a single alpha to its entire child subtree, including images, text, and nested widgets. It takes a floating-point "opacity" between 0.0 (fully transparent) and 1.0 (fully opaque).',
            ),
            TextBlock(
              'Reach for it when a group of widgets must fade together. For animations prefer "AnimatedOpacity" or "FadeTransition", which are GPU-cheap; a static "Opacity" still allocates a save layer, so do not stack it needlessly.',
            ),
            Wrap(
              spacing: 8,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  color: Colors.amber,
                  height: 100,
                  padding: EdgeInsets.all(8),
                  width: 100,
                  child: const Text('Without opacity'),
                ),
                Opacity(
                  opacity: 0.5,
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.amber,
                    height: 100,
                    padding: EdgeInsets.all(8),
                    width: 100,
                    child: const Text('With opacity'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
