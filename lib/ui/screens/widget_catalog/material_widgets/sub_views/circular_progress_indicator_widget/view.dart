import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CircularProgressIndicatorWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/circular_progress_indicator_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'CircularProgressIndicator',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _CircularProgressIndicatorWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _CircularProgressIndicatorWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"CircularProgressIndicator" widget has named parameters like backgroundColor, semanticsLabel, etc, which specify the widget\'s behavior.',
            ),
            Container(
              child: CircularProgressIndicator(
                semanticsLabel: 'Circular progress indicator',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
