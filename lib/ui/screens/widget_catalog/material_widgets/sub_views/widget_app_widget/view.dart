import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class WidgetsAppWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/widgets_app_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'WidgetsApp',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _WidgetsAppWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _WidgetsAppWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'WidgetsApp is the lowest-level "wrap the whole app" widget in Flutter. It provides the routing scaffolding, theme, locale, and media-query setup that every app needs, without imposing any specific design language. MaterialApp and CupertinoApp both build on top of it.',
            ),
            TextBlock(
              'You almost never use WidgetsApp directly — you use MaterialApp (which adds Material Design theming, components, and behaviors) or CupertinoApp (which adds the iOS-flavored equivalents). Reach for WidgetsApp only when you want a fully custom design system that is neither Material nor Cupertino.',
            ),
            TextBlock(
              'Tip: if you are tempted to use WidgetsApp because you want Material routing without Material theming, you can usually configure MaterialApp (theme: ThemeData(brightness: ...), useMaterial3:) to get the balance you want instead of dropping down a level.',
            ),
          ],
        ),
      ],
    );
  }
}
