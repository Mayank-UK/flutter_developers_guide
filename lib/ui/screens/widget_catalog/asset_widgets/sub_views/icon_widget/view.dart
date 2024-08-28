import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class IconWidgetView extends StatelessWidget {
  final String _appBarTitle = 'IconWidget';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/assets_icons_images/icon_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _IconWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _IconWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
                '"Icon" widget has named parameters like size, color, etc, which specify the icon.'),
            Container(
              child: Icon(
                Icons.person,
                size: 64,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
