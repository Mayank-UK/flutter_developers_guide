import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';

class ConstraintsView extends StatelessWidget {
  final String _appBarTitle = 'Constraints';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/dimensions_constraints/constraints_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      mobileUi: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _ConstraintsImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ConstraintsImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Using "Container" widget',
          content: [
            Container(
              child: Text(
                  '"Container" widget has a named parameter "constraints", which take an object of "BoxConstraints" class.'),
            ),
            Container(
              color: Colors.amber,
              constraints: BoxConstraints(
                minHeight: 50,
                minWidth: 50,
                maxHeight: 100,
                maxWidth: 300,
              ),
              padding: EdgeInsets.all(8),
              child: Text(
                  'minWidth is 50 and maxWidth is 300, \nadd or remove text from here to see effect'),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Using "ConstrainedBox" widget',
          content: [
            Container(
              child: Text(
                  '"ConstrainedBox" widget has a named parameter "constraints", which take an object of "BoxConstraints" class.'),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 50,
                minWidth: 50,
                maxHeight: 100,
                maxWidth: 300,
              ),
              child: Container(
                color: Colors.amber,
                padding: EdgeInsets.all(8),
                child: Text(
                    'minWidth is 50 and maxWidth is 300, \nadd or remove text from here to see effect'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
