import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class StackWidgetView extends StatelessWidget {
  final String _appBarTitle = 'Stack';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/stack_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _StackWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _StackWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"Stack" widget helps in positioning layout elements on top of each other.',
            ),
            Container(
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      color: Colors.amber,
                      height: 300,
                      width: 300,
                    ),
                  ),
                  Positioned(
                    child: Container(
                      color: Colors.red,
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Positioned(
                    child: Container(
                      color: Colors.blue,
                      height: 100,
                      width: 100,
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
