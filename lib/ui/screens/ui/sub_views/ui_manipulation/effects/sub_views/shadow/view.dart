import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';

class ShadowsView extends StatelessWidget {
  final String _appBarTitle = 'Shadows';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/effects/shadows_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      mobileUi: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _ShadowImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ShadowImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Using "Container" widget (preferred way)',
          content: [
            Container(
              child: Text(
                  '"Container" widget has a named parameter "decoration", which takes an object of "BoxDecoration" class.'),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              height: 100,
              width: 100,
            )
          ],
        ),
        SectionWrapper(
          title: 'Using "PhysicalModel" widget',
          content: [
            Container(
              child: Text(
                  '"PhysicalModel" widget has named properties like elevation, shadowColor, etc for defining shadow.'),
            ),
            Container(
              child: PhysicalModel(
                color: Colors.amber,
                elevation: 8,
                shadowColor: Colors.black87,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
