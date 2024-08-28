import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class TooltipWidgetView extends StatelessWidget {
  final String _appBarTitle = 'Tooltip';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/tool_tip_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _TooltipWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _TooltipWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"Tooltip" widget has named parameters like height, padding, decoration, message, etc, which specify the widget\'s behavior and UI.',
            ),
            Container(
              child: Tooltip(
                message: 'Tooltip demo',
                child: TextButton(
                    onPressed: () {},
                    child: const Text('hover over for tooltip')),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
