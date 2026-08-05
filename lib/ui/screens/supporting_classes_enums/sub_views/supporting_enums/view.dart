import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../components/section_wrapper.dart';

class SupportingEnumsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Most used supporting enums',
      markdownPath: 'assets/markdowns/supporting_classes_enums/supporting_enums_markdown.md',
      preview: _SupportingEnumsImplementation(),
    );
  }
}

class _SupportingEnumsImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Axis',
          content: [
            TextBlock(
              'The two cardinal directions in two dimensions.',
            ),
            TextBlock(
              'The axis is always relative to the current coordinate space. This means, for example, that a horizontal axis might actually be diagonally from top right to bottom left, due to some local Transform applied to the scene.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'AxisDirection',
          content: [
            TextBlock(
              'A direction along either the horizontal or vertical Axis.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'BorderStyle',
          content: [
            TextBlock(
              'The style of line to draw for a BorderSide in a Border.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'BoxFit',
          content: [
            TextBlock(
              'How a box should be inscribed into another box.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'BoxShape',
          content: [
            TextBlock(
              'The shape to use when rendering a Border or BoxDecoration.',
            ),
            TextBlock(
              'Consider using ShapeBorder subclasses directly (with ShapeDecoration), instead of using BoxShape and Border, if the shapes will need to be interpolated or animated. The Border class cannot interpolate between different shapes.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'FontStyle',
          content: [
            TextBlock(
              'Whether to slant the glyphs in the font.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'TextAlign',
          content: [
            TextBlock(
              'Whether and how to align text horizontally.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'TextDirection',
          content: [
            TextBlock(
              'A direction in which text flows.',
            ),
          ],
        ),
      ],
    );
  }
}
