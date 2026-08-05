import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AlignmentView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/alignment_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Alignment',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _AlignmentImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _AlignmentImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Using parent "Container" widget',
          content: [
            TextBlock(
              'Alignment positions a child inside its parent. The "Container.alignment" parameter takes an "Alignment" value like "topLeft" or "center", and the container also sizes itself to its parent so the child can be placed anywhere inside that space.',
            ),
            TextBlock(
              'Tip: "alignment" works on "Container" only when the child is smaller than the parent box; the parent expands to fill its own constraints and the child is positioned within it.',
            ),
            Container(
              alignment: Alignment.topLeft,
              color: Colors.amber,
              height: 128,
              margin: EdgeInsets.only(bottom: 8),
              padding: EdgeInsets.all(8),
              child: Container(
                color: Colors.red,
                padding: EdgeInsets.all(16),
                child: const Text('Text'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.amber,
              height: 128,
              margin: EdgeInsets.only(bottom: 8),
              padding: EdgeInsets.all(8),
              child: Container(
                color: Colors.red,
                padding: EdgeInsets.all(16),
                child: const Text('Text'),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              color: Colors.amber,
              height: 128,
              margin: EdgeInsets.only(bottom: 8),
              padding: EdgeInsets.all(8),
              child: Container(
                color: Colors.red,
                padding: EdgeInsets.all(16),
                child: const Text('Text'),
              ),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Individual child alignment using \'Align\' widget',
          content: [
            TextBlock(
              '"Align" is a dedicated widget that positions a single child at an "Alignment" inside a box that itself defaults to filling the parent. It is lighter and clearer than "Container" when alignment is the only job.',
            ),
            TextBlock(
              'For fine-grained control use "Alignment(x, y)" with values between -1.0 and 1.0, or "FractionalOffset" for layout-phase positioning. Pair with "widthFactor"/"heightFactor" when you want "Align" to hug the child instead of expanding.',
            ),
            Container(
              color: Colors.amber,
              margin: EdgeInsets.only(bottom: 8),
              padding: EdgeInsets.all(8),
              child: Wrap(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      color: Colors.red,
                      padding: EdgeInsets.all(16),
                      child: const Text('Text'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.red,
                      padding: EdgeInsets.all(16),
                      child: const Text('Text'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      color: Colors.red,
                      padding: EdgeInsets.all(16),
                      child: const Text('Text'),
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
