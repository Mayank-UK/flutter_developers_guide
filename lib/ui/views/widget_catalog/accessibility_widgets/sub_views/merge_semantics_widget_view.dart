import 'package:flutter/material.dart';

import '../../../../components/code_preview_component.dart';
import './../../../../components/section_wrapper_component_component.dart';
import './../../../../components/text_block_component.dart';

class MergeSemanticsWidgetView extends StatelessWidget {
  final String _appBarTitle = 'MergeSemantics';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/accessibility/merge_semantics_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabsComponent(
      appBarTitle: this._appBarTitle,
      previewTab: _MergeSemanticsWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _MergeSemanticsWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapperComponent(
          title: 'Simple use',
          content: [
            TextBlockComponent(
                '"MergeSemantics" widget, which provide semantics to a group of values like an input field and it\'s label.'),
            Container(
              child: MergeSemantics(
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: true,
                      onChanged: (bool? value) {},
                    ),
                    const Text("Settings"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
