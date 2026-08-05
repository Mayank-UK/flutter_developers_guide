import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../../../components/section_wrapper.dart';
import '../../../../../../../components/text_block.dart';

class PaddingSpacingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Padding',
      markdownPath: 'assets/markdowns/ui/ui_manipulation/spacing/padding_markdown.md',
      preview: _PaddingSpacingImplementation(),
    );
  }
}

class _PaddingSpacingImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Using "Container" widget (preferred way)',
          content: [
            TextBlock(
              'Padding is empty space inserted between a parent and its child. The "Container" widget exposes a "padding" parameter that accepts an "EdgeInsets" value, inflating the child inward from each edge.',
            ),
            TextBlock(
              'Use "EdgeInsets.all" for uniform insets, ".symmetric" for horizontal/vertical pairs, or ".only" / ".fromLTRB" when individual edges need different values. Padding always shrinks the child, never expands the parent.',
            ),
            Container(
              color: Colors.amber,
              padding: EdgeInsets.all(8),
              child: const Text('Padding of 8'),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Using "Padding" widget',
          content: [
            TextBlock(
              'When you only need padding and have no other decoration to apply, the dedicated "Padding" widget is lighter and more explicit than "Container". It takes the same "EdgeInsets" through its "padding" parameter.',
            ),
            TextBlock(
              'Prefer "Padding" inside a "Row"/"Column" where you are not setting color or borders, since the widget tree stays smaller and the intent is clearer to readers.',
            ),
            Container(
              color: Colors.amber,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  child: const Text('Padding of 8'),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
