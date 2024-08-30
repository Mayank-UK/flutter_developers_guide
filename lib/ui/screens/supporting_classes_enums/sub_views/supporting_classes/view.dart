import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';

import '../../../../components/code_preview_tabs.dart';
import '../../../../components/section_wrapper.dart';

class SupportingClassesView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/supporting_classes_enums/supporting_classes_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Most used supporting classes',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _SupportingClassesImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _SupportingClassesImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Alignment',
          content: [
            TextBlock(
              'A point within a rectangle.',
            ),
            TextBlock(
              'Alignment(0.0, 0.0) represents the center of the rectangle. The distance from -1.0 to +1.0 is the distance from one side of the rectangle to the other side of the rectangle. Therefore, 2.0 units horizontally (or vertically) is equivalent to the width (or height) of the rectangle.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'AssetImage',
          content: [
            TextBlock(
              'Fetches an image from an AssetBundle, having determined the exact image to use based on the context.',
            ),
            TextBlock(
              'Given a main asset and a set of variants, AssetImage chooses the most appropriate asset for the current context, based on the device pixel ratio and size given in the configuration passed to resolve.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'Border',
          content: [
            TextBlock(
              'A border of a box, comprised of four sides: top, right, bottom, left.',
            ),
            TextBlock(
              'The sides are represented by BorderSide objects.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'BorderRadius',
          content: [
            TextBlock(
              'An immutable set of radii for each corner of a rectangle.',
            ),
            TextBlock(
              'Used by BoxDecoration when the shape is a BoxShape.rectangle.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'BorderSide',
          content: [TextBlock('content will be available soon.')],
        ),
        SectionWrapper(
          title: 'BoxBorder',
          content: [TextBlock('content will be available soon.')],
        ),
        SectionWrapper(
          title: 'BoxDecoration',
          content: [TextBlock('content will be available soon.')],
        ),
        SectionWrapper(
          title: 'BoxShadow',
          content: [TextBlock('content will be available soon.')],
        ),
        SectionWrapper(
          title: 'Color',
          content: [TextBlock('content will be available soon.')],
        ),
        SectionWrapper(
          title: 'CircleBorder',
          content: [TextBlock('content will be available soon.')],
        ),
        SectionWrapper(
          title: 'EdgeInsets',
          content: [TextBlock('content will be available soon.')],
        ),
        SectionWrapper(
          title: 'FontWeight',
          content: [TextBlock('content will be available soon.')],
        ),
        SectionWrapper(
          title: 'Gradient',
          content: [TextBlock('content will be available soon.')],
        ),
        SectionWrapper(
          title: 'Shadow',
          content: [TextBlock('content will be available soon.')],
        ),
        SectionWrapper(
          title: 'TextDecoration',
          content: [TextBlock('content will be available soon.')],
        ),
        SectionWrapper(
          title: 'TextStyle',
          content: [TextBlock('content will be available soon.')],
        ),
      ],
    );
  }
}
