import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class MaterialAppWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/material_app_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'MaterialApp',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _MaterialAppWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _MaterialAppWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'MaterialApp is the root widget you put at the top of your widget tree to opt the whole app into Material Design. It wires up the things every Material app needs — a Navigator for routing, theme data (colors, typography, shapes), and the MediaQuery/Director scaffolding that descendant widgets read from.',
            ),
            TextBlock(
              'Beyond routing and theming, it gives you MaterialApp.router for declarative routing (with go_router / package:go_router), debug banner control, locale and localization delegates, and named-nav push/pop helpers. Most apps configure it once in main() and never touch it again.',
            ),
            TextBlock(
              'Tip: MaterialApp is opinionated toward Material Design. If you are building a Cupertino-flavored app (or one that should respect the running platform), use CupertinoApp or the lower-level WidgetsApp — they give you the routing scaffolding without imposing Material theme on every widget.',
            ),
          ],
        ),
      ],
    );
  }
}
