import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ConstrainedBoxWidgetView extends StatelessWidget {
  final String _appBarTitle = 'ConstrainedBox';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/constrained_box_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _ConstrainedBoxWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ConstrainedBoxWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"BoxConstraints" widget has a named parameter constraints which define the constraints of it\'s child.',
            ),
            Container(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 50,
                  minWidth: 100,
                  maxHeight: 100,
                  maxWidth: 100,
                ),
                child: Container(
                  color: Colors.amber,
                  height: 100,
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
