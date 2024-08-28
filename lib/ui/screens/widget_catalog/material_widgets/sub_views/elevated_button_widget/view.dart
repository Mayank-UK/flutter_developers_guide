import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ElevatedButtonWidgetView extends StatelessWidget {
  final String _appBarTitle = 'ElevatedButton';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/elevated_button_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _ElevatedButtonWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ElevatedButtonWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"ElevatedButton" widget has named parameters onPressed and child which specify the button behavior and content.',
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Button'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
