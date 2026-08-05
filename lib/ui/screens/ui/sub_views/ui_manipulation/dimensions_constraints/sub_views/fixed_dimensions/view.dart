import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';
import '../../../../../../../components/text_block.dart';

class FixedDimensionsView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/dimensions_constraints/fixed_dimensions_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Fixed dimensions',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _FixedDimensionsImplimentation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _FixedDimensionsImplimentation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Using "Container" widget (preferred way)',
          content: [
            TextBlock(
              'Fixed dimensions lock a widget to an exact width and height in logical pixels. The "Container" widget exposes "height" and "width" parameters that take raw doubles, and it can also apply alignment, color, and decoration in the same node.',
            ),
            TextBlock(
              'Fixed sizes ignore the incoming constraints less than a "SizedBox" does — they are honored only when the parent permits them, so a 100px box inside a 50px slot will still be clamped by the parent.',
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.amber,
              height: 100,
              width: 100,
              child: const Text('Container'),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Using "SizedBox" widget',
          content: [
            TextBlock(
              '"SizedBox" is the lightest way to force a fixed size: it accepts "height" and "width" and tightens its child to those values without adding any decoration. Use it when you only need to constrain size.',
            ),
            TextBlock(
              'Passing only one dimension leaves the other loose, which is handy for forcing item heights in a "ListView" or column widths in a "Row" without touching the cross axis.',
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: Container(
                alignment: Alignment.center,
                color: Colors.amber,
                child: const Text('SizedBox'),
              ),
            )
          ],
        ),
      ],
    );
  }
}
