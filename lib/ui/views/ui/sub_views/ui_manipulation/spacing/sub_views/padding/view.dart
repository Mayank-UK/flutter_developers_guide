import 'package:flutter/material.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';

class PaddingSpacingView extends StatelessWidget {
  final String _appBarTitle = 'Padding';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/spacing/padding_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _PaddingSpacingImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _PaddingSpacingImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Using "Container" widget (preferred way)',
          content: [
            Container(
              child: Text(
                  '"Container" widget has a named parameter "padding", which takes an object of "EdgeInsets" class.'),
            ),
            Container(
              color: Colors.amber,
              padding: EdgeInsets.all(8),
              child: const Text('Padding of 8'),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Using "Padding" widget',
          content: [
            Container(
              child: Text(
                  '"Padding" widget has a named parameter "padding", which takes an object of "EdgeInsets" class.'),
            ),
            Container(
              color: Colors.amber,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  child: const Text('Padding of 8'),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
