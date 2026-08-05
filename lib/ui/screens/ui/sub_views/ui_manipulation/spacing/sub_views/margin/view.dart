import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';
import '../../../../../../../components/text_block.dart';

class MarginSpacingView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/spacing/margin_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Margin',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _MarginImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _MarginImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Using "Container" widget',
          content: [
            TextBlock(
              'Margin is empty space pushed outward from a widget to its parent, separating it from surrounding elements. The "Container" widget exposes a "margin" parameter accepting an "EdgeInsets" value.',
            ),
            TextBlock(
              'Padding insets the child inward, margin offsets the box outward, so they stack independently. Negative margins are not supported, but "Transform.translate" can overlap siblings when you need that effect.',
            ),
            Container(
              alignment: Alignment.topLeft,
              color: Colors.amber,
              height: 100,
              width: double.infinity,
              child: Container(
                color: Colors.red,
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                child: const Text('Margin of 8 from parent'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
