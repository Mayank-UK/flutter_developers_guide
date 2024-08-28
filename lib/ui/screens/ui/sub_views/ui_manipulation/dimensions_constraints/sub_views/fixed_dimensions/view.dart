import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';

class FixedDimensionsView extends StatelessWidget {
  final String _appBarTitle = 'Fixed dimensions';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/dimensions_constraints/fixed_dimensions_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _FixedDimensionsImplimentation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _FixedDimensionsImplimentation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Using "Container" widget (preferred way)',
          content: [
            Container(
              child: Text(
                  '"Container" has named parameters "height" and "width", which take numerical values.'),
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.amber,
              height: 100,
              width: 100,
              child: const Text('Container'),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Using "SizedBox" widget',
          content: [
            Container(
              child: Text(
                  '"SizedBox" has named parameters "height" and "width", which take numerical values.'),
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: Container(
                alignment: Alignment.center,
                color: Colors.amber,
                child: const Text('SizedBox'),
              ),
            )
          ],
        ),
      ],
    );
  }
}
