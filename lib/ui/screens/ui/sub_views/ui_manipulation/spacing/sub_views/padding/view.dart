import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';

class PaddingSpacingView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/spacing/padding_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Padding',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _PaddingSpacingImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
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
