import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class LimitedBoxWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/limited_box_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'LimitedBox',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _LimitedBoxWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _LimitedBoxWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'LimitedBox imposes a maximum width and height on its child, but only when the child receives unbounded constraints (i.e. the parent does not already cap the size). When the parent is bounded, LimitedBox is a no-op.',
            ),
            Container(
              child: LimitedBox(
                maxHeight: 50,
                maxWidth: 50,
                child: Container(
                  color: Colors.amber,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
