import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class FittedBoxWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/fitted_box_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'FittedBox',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _FittedBoxWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _FittedBoxWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'FittedBox scales and positions its child to fit inside itself, using a BoxFit (contain, cover, fill, fitWidth, fitHeight, scaleDown). Unlike a raw SizedBox it does not clip the child to a fixed size — it linearly transforms it so the child fits the available box.',
            ),
            TextBlock(
              'The classic use case is preventing text or an image from overflowing its parent: a long label inside a small button will shrink cleanly with BoxFit.scaleDown. Tip: combine FittedBox with a bounded parent (e.g. a SizedBox or a flex with Expanded) so the widget knows what it is fitting into.',
            ),
            Container(
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image(
                  image: AssetImage('assets/images/demo.jpeg'),
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
