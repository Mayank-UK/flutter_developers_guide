import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ScrollConfigurationWidgetView extends StatelessWidget {
  final String _appBarTitle = 'ScrollConfiguration';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/scrolling/scroll_configuration_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _ScrollConfigurationWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ScrollConfigurationWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Content will be updated soon.',
            ),
            Container(),
          ],
        ),
      ],
    );
  }
}
