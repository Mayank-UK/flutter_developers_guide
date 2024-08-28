import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class PaddingWidgetView extends StatelessWidget {
  final String _appBarTitle = 'Padding';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/padding_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _PaddingWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _PaddingWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"Padding" widget has a named parameter padding, which specify the padding around it\'s children.',
            ),
            Container(
              child: Container(
                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
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
