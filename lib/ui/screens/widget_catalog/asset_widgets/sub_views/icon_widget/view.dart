import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class IconWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/assets_icons_images/icon_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'IconWidget',
      mobileUi: [
        CodePreviewTabs(
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
              'Icon displays a single glyph from an icon font (such as the bundled Material Icons) at a given size and color. Use it for compact, scalable vector imagery — toolbar actions, list leading icons, status indicators — that should tint with your theme.',
            ),
            TextBlock(
              'When you omit color, the icon inherits from IconTheme, which ultimately follows ThemeData.iconTheme, so it adapts to light/dark automatically. Because glyphs come from a font, they stay crisp at any size and recolor freely, but they cannot represent multi-color artwork — for photographs or detailed images use Image instead.',
            ),
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
