import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';
import 'package:flutter_developers_guide/ui/design_system/sizes.dart';

import '../../../../../../../components/section_wrapper.dart';
import '../../../../../../../components/text_block.dart';

class BasicLayoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Basic layout',
      markdownPath: 'assets/markdowns/ui/ui_manipulation/layout/basic_layout_widgets_markdown.md',
      preview: _BasicLayoutImplementation(),
    );
  }
}

class _BasicLayoutImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Using "Container" widget',
          content: [
            TextBlock(
              '"Container" is the workhorse wrapper: it can paint a background, apply padding and margin, align a child, and accept sizing constraints, all on a single node. With none of those set it simply passes its child through.',
            ),
            TextBlock(
              'Because "Container" combines many features it can hide intent — when you only need padding, prefer "Padding"; when you only need a fixed size, prefer "SizedBox". Reserve "Container" for cases that genuinely need several of its capabilities together.',
            ),
            Container(
              color: Colors.amber,
              padding: EdgeInsets.all(8),
              child: const Text('Text inside a container'),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Using "Row" widget',
          content: [
            TextBlock(
              'A "Row" lays its children out horizontally in reading order; it is the horizontal counterpart of "Column". When total child width exceeds the available width it overflows (the infamous yellow-black stripe) instead of wrapping.',
            ),
            TextBlock(
              'Prefer "Wrap" when content length is unknown or might overflow; "Row" is right when items are fixed or you wrap each in "Expanded"/"Flexible" so they share the available main-axis space.',
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  color: Colors.amber,
                  height: 50,
                  margin: EdgeInsets.only(right: 8),
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  margin: EdgeInsets.only(right: 8),
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  margin: EdgeInsets.only(right: 8),
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  margin: EdgeInsets.only(right: 8),
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  margin: EdgeInsets.only(right: 8),
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  margin: EdgeInsets.only(right: 8),
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  margin: EdgeInsets.only(right: 8),
                  width: 50,
                ),
              ],
            )
          ],
        ),
        SectionWrapper(
          title: 'Using "Column" widget',
          content: [
            TextBlock(
              '"Column" stacks its children vertically and is the vertical counterpart of "Row". Children are laid out top-to-bottom; the column sizes itself to its parent on the cross axis and to its children on the main axis by default.',
            ),
            TextBlock(
              'When a column is placed inside a scrollable parent (or its content might overflow the screen), wrap it in a "SingleChildScrollView" or replace it with a "ListView"; otherwise large content produces a layout overflow.',
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.amber,
                    height: 50,
                    margin: EdgeInsets.only(bottom: 8),
                    width: 50,
                  ),
                  Container(
                    color: Colors.amber,
                    height: 50,
                    margin: EdgeInsets.only(bottom: 8),
                    width: 50,
                  ),
                  Container(
                    color: Colors.amber,
                    height: 50,
                    margin: EdgeInsets.only(bottom: 8),
                    width: 50,
                  ),
                  Container(
                    color: Colors.amber,
                    height: 50,
                    margin: EdgeInsets.only(bottom: 8),
                    width: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Using "Wrap" widget',
          content: [
            TextBlock(
              '"Wrap" lays children out like a "Row" or "Column" but flows them onto a new line (or column) when the available space runs out, controlled by the "direction" parameter. "spacing" and "runSpacing" set gaps within and between runs.',
            ),
            TextBlock(
              'It is the right choice for chip clouds, tag lists, and any dynamically-sized set of items. Unlike "Row" it cannot "Expanded" its children — pair it with fixed- or intrinsic-sized children for predictable wrapping.',
            ),
            Container(
              child: const Text('Wrap in horizontal with spacing of 8'),
            ),
            Wrap(
              direction: Axis.horizontal,
              runSpacing: 8,
              spacing: 8,
              children: <Widget>[
                Container(
                  color: Colors.amber,
                  height: 50,
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  width: 50,
                ),
              ],
            ),
            Container(
              width: double.infinity,
              child:
                  const Text('Wrap in vertical direction with spacing of 8.'),
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: Wrap(
                direction: Axis.vertical,
                runSpacing: 8,
                spacing: 8,
                children: <Widget>[
                  Container(
                    color: Colors.amber,
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    color: Colors.amber,
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    color: Colors.amber,
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    color: Colors.amber,
                    height: 50,
                    width: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Other widgets',
          content: [
            TextBlock(
              'Flutter also ships focused single-purpose widgets such as "SizedBox", "LimitedBox", "DecoratedBox", and "Padding". Each does one slice of what "Container" offers, so most can be replaced by "Container" — but using the specific widget often communicates intent more clearly and keeps the tree lighter.',
            ),
            TextBlock(
              'Rule of thumb: reach for the most specific widget that does the job. "SizedBox" for a gap, "Padding" for insets, "DecoratedBox" for a border or gradient, "ConstrainedBox" for bounds — only combine them via "Container" when several are needed at once.',
            ),
          ],
        ),
      ],
    );
  }
}
