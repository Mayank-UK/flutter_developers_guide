import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class DecoratedBoxWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'DecoratedBox',
      markdownPath: 'assets/markdowns/widget_catalog/painting_effects/decorated_box_markdown.md',
      preview: _DecoratedBoxWidgetImplementation(),
    );
  }
}

class _DecoratedBoxWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'DecoratedBox paints a BoxDecoration — color, border, borderRadius, shadow, gradient, shape — either behind or in front of its child, controlled by the `position` parameter. It is the painting engine that Container composes internally.',
            ),
            TextBlock(
              'Use it directly when you want the decoration without Container\'s extra padding/alignment/margin machinery, or when you need to stack decorations via DecorationPosition.background and foreground. For the common single-decoration case, Container reads more clearly and nests less.',
            ),
            Container(
              child: DecoratedBox(
                position: DecorationPosition.background,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  border: Border.all(
                    color: const Color(0xFF000000),
                    style: BorderStyle.solid,
                    width: 4.0,
                  ),
                  borderRadius: BorderRadius.zero,
                  shape: BoxShape.rectangle,
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Color(0x66000000),
                      blurRadius: 10.0,
                      spreadRadius: 4.0,
                    )
                  ],
                ),
                child: Container(
                  child: Container(
                    width: 100,
                    height: 100,
                    padding: EdgeInsets.all(20),
                    child: FlutterLogo(),
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
