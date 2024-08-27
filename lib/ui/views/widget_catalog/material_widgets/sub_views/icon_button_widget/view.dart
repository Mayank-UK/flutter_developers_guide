import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class IconButtonWidgetView extends StatelessWidget {
  final String _appBarTitle = 'IconButton';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/icon_button_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _IconButtonWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _IconButtonWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"IconButton" widget has named parameters like onPressed, icon, etc, which specify the widget\'s behavior and layout.',
            ),
            Container(
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.ac_unit,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
