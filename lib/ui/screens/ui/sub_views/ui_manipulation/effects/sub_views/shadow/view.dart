import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../../../components/section_wrapper.dart';
import '../../../../../../../components/text_block.dart';

class ShadowsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Shadows',
      markdownPath: 'assets/markdowns/ui/ui_manipulation/effects/shadows_markdown.md',
      preview: _ShadowImplementation(),
    );
  }
}

class _ShadowImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Using "Container" widget (preferred way)',
          content: [
            TextBlock(
              'Shadows give a widget depth, separating it from the background. The "Container" widget takes a "BoxDecoration" through its "decoration" parameter, and "boxShadow" accepts a list of "BoxShadow" objects controlling color, blur radius, spread, and offset.',
            ),
            TextBlock(
              'Tip: you cannot use "Container.color" together with "Container.decoration" — put the color inside the "BoxDecoration" instead. Multiple "BoxShadow" entries stack, letting you layer a soft ambient shadow with a sharper directional one.',
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              height: 100,
              width: 100,
            )
          ],
        ),
        SectionWrapper(
          title: 'Using "PhysicalModel" widget',
          content: [
            TextBlock(
              '"PhysicalModel" renders a shadow based on Material "elevation" rather than a manual "BoxShadow", so the result tracks the ambient light direction of the surrounding "Material" and animates smoothly during transitions.',
            ),
            TextBlock(
              'Use it for genuinely elevated surfaces (cards, dialogs, FABs); reach for "BoxDecoration.boxShadow" when you need an arbitrary shape or offset that elevation can\'t express.',
            ),
            Container(
              child: PhysicalModel(
                color: Colors.amber,
                elevation: 8,
                shadowColor: Colors.black87,
                borderRadius: BorderRadius.circular(20),
                child: Container(
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
