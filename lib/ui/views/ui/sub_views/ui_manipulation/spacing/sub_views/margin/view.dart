import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';

class MarginSpacingView extends StatelessWidget {
  final String _appBarTitle = 'Margin';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/spacing/margin_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
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
            Container(
              child: Text(
                  '"Container" widget has a named parameter "margin", which takes an object of "EdgeInsets" class.'),
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
