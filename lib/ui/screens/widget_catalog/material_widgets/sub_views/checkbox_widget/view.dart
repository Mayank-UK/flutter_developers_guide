import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CheckboxWidgetView extends StatelessWidget {
  final String _appBarTitle = 'Checkbox';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/checkbox_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      mobileUi: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _CheckboxWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _CheckboxWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"Checkbox" widget has named parameters onChanges and value, which the specify the box\'s content and value.',
            ),
            Container(
              child: Checkbox(
                onChanged: (value) {},
                value: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
