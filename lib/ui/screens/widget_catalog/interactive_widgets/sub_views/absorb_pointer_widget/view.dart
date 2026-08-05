import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AbsorbPointerWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'AbsorbPointer',
      markdownPath: 'assets/markdowns/widget_catalog/interactive/absorb_pointer_markdown.md',
      preview: _AbsorbPointerWidgetImplementation(),
    );
  }
}

class _AbsorbPointerWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'AbsorbPointer terminates hit-testing at itself: when absorbing is true, no pointer events reach its subtree, so any buttons, switches, or gestures below go dead. It still paints and lays out its child normally — only interactivity is blocked.',
            ),
            TextBlock(
              'Use it to lock an entire overlay behind a modal without removing it from the tree — for instance, a translucent scrim that swallows taps so they never hit the page underneath. For the opposite case (pass clicks through a decorative overlay to the widget below), use IgnorePointer instead, which is itself invisible to hit-testing.',
            ),
            Container(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Container(
                    width: 200.0,
                    height: 100.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: null,
                    ),
                  ),
                  Container(
                    width: 100.0,
                    height: 200.0,
                    child: AbsorbPointer(
                      absorbing: true,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade200,
                        ),
                        onPressed: () {},
                        child: null,
                      ),
                    ),
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
