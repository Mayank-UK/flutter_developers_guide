import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ExcludeSemanticsWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'ExcludeSemantics',
      markdownPath: 'assets/markdowns/widget_catalog/accessibility/exclude_semantics_markdown.md',
      preview: _ExcludeSemanticsWidgetImplementation(),
    );
  }
}

class _ExcludeSemanticsWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
                'ExcludeSemantics drops the entire accessibility subtree under it, so screen readers never announce its descendants. Wrap purely decorative or redundant content — an avatar that duplicates a visible label, a background image, a divider — so assistive tech skips it instead of reading clutter.'),
            TextBlock(
              'Toggle the excluding flag at runtime to turn the suppression on and off conditionally. When you need finer control (hide one property but keep another), reach for Semantics with explicit flags instead of nuking the whole subtree.',
            ),
            Container(
              child: ExcludeSemantics(
                excluding: true,
                child: Image(
                  height: 64,
                  width: 64,
                  image: AssetImage(
                    'assets/images/demo.jpeg',
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
