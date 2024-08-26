import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ContainerWidgetView extends StatelessWidget {
  final String _appBarTitle = 'Container';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/container_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _ContainerWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _ContainerWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"Container" widget has named parameters like height, width, color, constraints, etc, which make it the most useful widget in flutter.',
            ),
            Container(
              child: Container(
                color: Colors.amber,
                height: 100,
                width: 100,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
