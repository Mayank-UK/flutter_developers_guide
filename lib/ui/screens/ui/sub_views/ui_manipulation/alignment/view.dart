import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';

class AlignmentView extends StatelessWidget {
  final String _appBarTitle = 'Alignment';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/alignment_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _AlignmentImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _AlignmentImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Using parent "Container" widget',
          content: [
            Container(
              child: Text(
                  '"Container" widget has a named parameter "alignment" which takes a value made available using "Alignment" enum.'),
            ),
            Container(
              alignment: Alignment.topLeft,
              color: Colors.amber,
              height: 128,
              margin: EdgeInsets.only(bottom: 8),
              padding: EdgeInsets.all(8),
              child: Container(
                color: Colors.red,
                padding: EdgeInsets.all(16),
                child: const Text('Text'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.amber,
              height: 128,
              margin: EdgeInsets.only(bottom: 8),
              padding: EdgeInsets.all(8),
              child: Container(
                color: Colors.red,
                padding: EdgeInsets.all(16),
                child: const Text('Text'),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              color: Colors.amber,
              height: 128,
              margin: EdgeInsets.only(bottom: 8),
              padding: EdgeInsets.all(8),
              child: Container(
                color: Colors.red,
                padding: EdgeInsets.all(16),
                child: const Text('Text'),
              ),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Individual child alignment using \'Align\' widget',
          content: [
            Container(
              child: Text(
                  '"Align" widget uses a named parameter "alignment", which takes a value made available using "Alignment" enum.'),
            ),
            Container(
              color: Colors.amber,
              margin: EdgeInsets.only(bottom: 8),
              padding: EdgeInsets.all(8),
              child: Wrap(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      color: Colors.red,
                      padding: EdgeInsets.all(16),
                      child: const Text('Text'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.red,
                      padding: EdgeInsets.all(16),
                      child: const Text('Text'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      color: Colors.red,
                      padding: EdgeInsets.all(16),
                      child: const Text('Text'),
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
