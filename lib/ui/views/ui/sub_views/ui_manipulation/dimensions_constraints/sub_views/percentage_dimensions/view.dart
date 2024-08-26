import 'package:flutter/material.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';

class PercentageDimensionsView extends StatelessWidget {
  final String _appBarTitle = 'Percentage dimensions';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/dimensions_constraints/percentage_dimensions_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _PercentageDimensionsImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _PercentageDimensionsImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Using "FractionallySizedBox" widget',
          content: [
            Container(
              child: Text(
                  '"FractionallySizedBox" widget has named parameters "heightFactor" and "widthFactor", which take floating point values.'),
            ),
            Container(
              child: Text(
                  'For this widget to work parent should have a definitive height and width, so it do not work inside rows, columns and wraps directly.'),
            ),
            Container(
              alignment: Alignment.topLeft,
              color: Colors.amber,
              height: 100,
              width: double.infinity,
              child: FractionallySizedBox(
                heightFactor: 0.5,
                widthFactor: 0.8,
                child: Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: const Text('80% width and 50% height of parent'),
                ),
              ),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Using "Expanded" widget inside "Row" and "Column" widget',
          content: [
            Container(
              child: Text(
                  '"Expanded" let\'s you fill the available space, horizontally in a row and vertically in a column.'),
            ),
            Container(
              child: Text(
                  '"Expanded" widget has a named parameter "flex", which takes a numerical value.'),
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.amber,
                      child: const Text('75% height'),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: const Text('25% height'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.amber,
                      child: const Text('75% width'),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: const Text('25% width'),
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
