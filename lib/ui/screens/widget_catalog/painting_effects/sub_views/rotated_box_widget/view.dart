import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class RotatedBoxWidgetView extends StatelessWidget {
  final String _appBarTitle = 'RotatedBox';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/painting_effects/rotated_box_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      mobileUi: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _RotatedBoxWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _RotatedBoxWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"RotatedBox" widget has named parameter quarterTurns, which rotate it\'s child.',
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Sample text'),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                  ),
                  RotatedBox(
                    quarterTurns: 3,
                    child: const Text(
                      'Sample text',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
