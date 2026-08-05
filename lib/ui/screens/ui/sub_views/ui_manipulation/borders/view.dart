import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

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
            TextBlock(
              'Borders are drawn by the "BoxDecoration" passed to "Container.decoration". Use "Border.all" for a uniform outline, "Border()" to specify each edge individually, and "borderRadius" for rounded corners.',
            ),
            TextBlock(
              'Tip: "Container.color" and "Container.decoration" are mutually exclusive — when you need a border, move any fill color into the "BoxDecoration.color".',
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
            TextBlock(
              '"DecoratedBox" is the lower-level widget that "Container.decoration" uses internally: it takes a "BoxDecoration" (or any "Decoration") and paints it around a child, with no other container features.',
            ),
            TextBlock(
              'Prefer it over "Container" when you only need a decoration and want to keep the tree lean; reach for "Container" when you also need padding, margin, or alignment on the same node.',
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
