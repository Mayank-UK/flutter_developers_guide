import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class LinearProgressIndicatorWidgetView extends StatelessWidget {
  final String _appBarTitle = 'LinearProgressIndicator';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/linear_progress_indicator_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _LinearProgressIndicatorWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _LinearProgressIndicatorWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"LinearProgressIndicator" widget has named parameters like value, backgroundColor, semanticsLabel, etc, which specify the widget\'s behavior.',
            ),
            Container(
              child: LinearProgressIndicator(
                semanticsLabel: 'Linear progress indicator',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
