import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class MaterialAppWidgetView extends StatelessWidget {
  final String _appBarTitle = 'MaterialApp';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/material_app_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _MaterialAppWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _MaterialAppWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'A widget that sits at the root level and encloses all other widgets to create a UI based on google\'s material theme.',
            ),
            Container(),
          ],
        ),
      ],
    );
  }
}
