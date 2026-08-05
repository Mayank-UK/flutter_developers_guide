import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class RotatedBoxWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'RotatedBox',
      markdownPath: 'assets/markdowns/widget_catalog/painting_effects/rotated_box_markdown.md',
      preview: _RotatedBoxWidgetImplementation(),
    );
  }
}

class _RotatedBoxWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'RotatedBox rotates its child by an integral number of quarter turns — 1 means 90°, 2 means 180°, and so on. Unlike Transform.rotate, the rotation is applied during layout, so the child\'s hit-testing, text direction, and the footprint it leaves for siblings all reflect the rotated dimensions.',
            ),
            TextBlock(
              'Use it for permanent quarter-turn orientations such as a vertical label or a portrait control turned sideways. For arbitrary angles or animated rotations reach for Transform.rotate instead; RotatedBox only accepts whole quarter turns but is cheaper and layout-correct for those.',
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Sample text'),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                  ),
                  RotatedBox(
                    quarterTurns: 3,
                    child: const Text(
                      'Sample text',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
