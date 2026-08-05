import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CenterWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Center',
      markdownPath: 'assets/markdowns/widget_catalog/layout/center_markdown.md',
      preview: _CenterWidgetImplementation(),
    );
  }
}

class _CenterWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Center is a specialization of Align with alignment fixed to Alignment.center. It sizes itself to its parent and places the child dead-centre both horizontally and vertically.',
            ),
            TextBlock(
              'Tip: like Align, Center expands to fill its parent by default. If you want it to shrink-wrap the child instead, pass widthFactor and heightFactor (1.0 makes Center hug the child tightly).',
            ),
            Container(
              child: Center(
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
