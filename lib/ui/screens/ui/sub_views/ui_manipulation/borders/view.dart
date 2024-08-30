import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';

class BordersView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/borders_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Borders',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _BordersImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _BordersImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Using \'Container\' widget (preferred way)',
          content: [
            Container(
              child: Text(
                  '"Container" widget has a named parameter "decoration", which takes an object of "BoxDecoration" class with specified values.'),
            ),
            Wrap(
              spacing: 8,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blueAccent,
                      width: 2,
                    ),
                  ),
                  child: Text("Text"),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.blueAccent,
                        width: 3.0,
                      ),
                      right: BorderSide(
                        color: Colors.blueAccent,
                        width: 3.0,
                      ),
                    ),
                  ),
                  child: Text("Text"),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blueAccent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Text("Text"),
                ),
              ],
            ),
          ],
        ),
        SectionWrapper(
          title: 'Using \'DecoratedBox\' widget',
          content: [
            Container(
              child: Text(
                  '"DecoratedBox" widget has a named parameter "decoration", which takes an object of "BoxDecoration" class.'),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
              ),
              child: Container(
                padding: EdgeInsets.all(8),
                child: const Text('Text'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
