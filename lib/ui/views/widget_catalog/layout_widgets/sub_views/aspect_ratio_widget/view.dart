import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AspectRatioWidgetView extends StatelessWidget {
  final String _appBarTitle = 'AspectRatio';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/aspect_ratio_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _AspectRatioWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _AspectRatioWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
                '"AspectRatio" has a named parameter "aspectRatio" which specify the aspect ration of the child.'),
            Container(
              child: AspectRatio(
                aspectRatio: 4 / 2,
                child: Container(
                  color: Colors.amber,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
