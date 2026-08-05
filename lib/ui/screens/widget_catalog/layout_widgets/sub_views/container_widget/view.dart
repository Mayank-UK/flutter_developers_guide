import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ContainerWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Container',
      markdownPath: 'assets/markdowns/widget_catalog/layout/container_markdown.md',
      preview: _ContainerWidgetImplementation(),
    );
  }
}

class _ContainerWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Container is a combinator widget that, depending on which parameters you set, internally wraps your child in a Padding (padding), DecoratedBox (color, decoration), ConstrainedBox (constraints), Transform (transform), Align (alignment), or SizedBox (width / height). With no parameters at all it is just an empty widget that fills its parent.',
            ),
            TextBlock(
              'It is the everyday workhorse for styling and sizing boxes, but it is also easy to over-use: if all you need is padding, prefer Padding; if all you need is a fixed size, prefer SizedBox. Those single-purpose widgets make the layout intent clearer and avoid the slightly heavier widget tree Container builds.',
            ),
            Container(
              child: Container(
                color: Colors.amber,
                height: 100,
                width: 100,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
