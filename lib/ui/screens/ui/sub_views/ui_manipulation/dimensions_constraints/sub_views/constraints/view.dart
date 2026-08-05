import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';
import '../../../../../../../components/text_block.dart';

class ConstraintsView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/dimensions_constraints/constraints_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Constraints',
      mobileUi: [
        CodePreviewTabs(
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
            TextBlock(
              'Constraints let you set a range (min/max width and height) instead of a fixed size, so a child can flex between floors and ceilings while still being bounded. "Container" accepts a "constraints" parameter of type "BoxConstraints".',
            ),
            TextBlock(
              'Tip: in Flutter the parent always wins — a child\'s requested size is intersected with the parent constraints. Use constraints when content size varies (e.g. text length, network images) but you must cap its layout footprint.',
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
            TextBlock(
              '"ConstrainedBox" applies a "BoxConstraints" to its child without adding any decoration, mirroring what "Container.constraints" does under the hood. Prefer it when "Container" would only be a passive wrapper.',
            ),
            TextBlock(
              'For width-only or height-only bounds, "ConstrainedBox" combined with "tightFor" or the dedicated "MinWidth"/"MaxWidth" style helpers keeps the tree readable. "BoxConstraints" must be satisfiable — never set min greater than max.',
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
