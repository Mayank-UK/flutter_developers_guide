import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class BaselineWidgetView extends StatelessWidget {
  final String _appBarTitle = 'Baseline';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/baseline_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _BaselineWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _BaselineWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"Baseline" widget has named parameters like "baseline", "baselineType", etc, which specify the widget behavior.',
            ),
            Container(
              child: Container(
                color: Colors.teal,
                height: 200,
                margin: const EdgeInsets.only(
                  top: 64,
                ),
                width: 200,
                child: Baseline(
                  baseline: 0,
                  baselineType: TextBaseline.alphabetic,
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
