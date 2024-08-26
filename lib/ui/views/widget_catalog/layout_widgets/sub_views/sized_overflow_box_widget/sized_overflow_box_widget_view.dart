import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class SizedOverflowBoxWidgetView extends StatelessWidget {
  final String _appBarTitle = 'SizedOverflowBox';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/sized_overflow_box_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _SizedOverflowBoxWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _SizedOverflowBoxWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(''),
            Container(
              child: Container(
                color: Colors.amber,
                child: SizedOverflowBox(
                  size: const Size(
                    80.0,
                    100.0,
                  ),
                  child: Container(
                    height: 50.0,
                    width: 200.0,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
