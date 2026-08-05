import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';
import '../../../../../../../components/text_block.dart';

class PercentageDimensionsView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/dimensions_constraints/percentage_dimensions_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Percentage dimensions',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _PercentageDimensionsImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
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
            TextBlock(
              '"FractionallySizedBox" sizes its child as a fraction of the parent\'s size, using "widthFactor" and "heightFactor" between 0.0 and 1.0 (values above 1.0 are allowed and overflow the parent).',
            ),
            TextBlock(
              'Gotcha: the parent must already have a finite size, so it does not work directly inside a "Row", "Column", or "Wrap" whose main axis is unbounded — wrap it in a sized parent first or use "Expanded" instead.',
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
            TextBlock(
              '"Expanded" divides the leftover space along a "Row" or "Column" main axis among its siblings. The "flex" parameter sets the share; siblings with the same flex split evenly.',
            ),
            TextBlock(
              'Use "Expanded" instead of fixed widths when content should reflow on different screens — pair with "Flexible" for "fit: loose" children that only expand when there is room.',
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
