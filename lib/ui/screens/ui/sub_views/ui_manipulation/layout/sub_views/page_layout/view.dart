import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';
import '../../../../../../../components/text_block.dart';

class PageLayoutView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/layout/application_page_layout_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Application and page layout',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _PageLayoutImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _PageLayoutImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'General information',
          content: [
            TextBlock(
              'A Flutter app is rooted in one of two design-system widgets: "MaterialApp" (Google\'s Material, the default for Android and a sensible cross-platform choice) or "CupertinoApp" (Apple\'s iOS look). You can also ship a fully custom "WidgetsApp" if neither fits.',
            ),
            TextBlock(
              'Beneath the root, every screen is built around a "Scaffold" (Material) or "CupertinoPageScaffold", which provide the page chrome — app bar, body, drawer, bottom navigation, and FAB slots. To use any of these widgets, import "package:flutter/material.dart", "package:flutter/cupertino.dart", or the lower-level "package:flutter/widgets.dart".',
            ),
          ],
        ),
        SectionWrapper(
          title: 'Using "MaterialApp" at root(main.dart)',
          content: [
            TextBlock(
              '"MaterialApp" configures the whole app: "home" (or "routes"/"onGenerateRoute") picks the entry screen, "theme" supplies global styling, and "debugShowCheckedModeBanner" toggles the corner banner. It also wires in "Navigator", "MediaQuery", and "Hero" support.',
            ),
            TextBlock(
              'Each route then returns a "Scaffold" with its own "appBar", "body", "drawer", "bottomNavigationBar", and "floatingActionButton". Keep the "MaterialApp" thin — push business logic into widgets further down the tree so the root stays a configuration node.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'Using "CupertinoApp" at root(main.dart)',
          content: [
            TextBlock(
              '"CupertinoApp" is the iOS-flavored counterpart: it configures "CupertinoTheme", "CupertinoLocalizations", and an iOS-style "Navigator". Use it when the whole app should look native on Apple platforms, or mix it with Material widgets per screen.',
            ),
            TextBlock(
              'You can interleave both: keep "MaterialApp" at the root and drop in "CupertinoPageScaffold", "CupertinoNavigationBar", and "CupertinoButton" where an iOS feel is wanted — Flutter widgets cooperate, so the two design systems compose within a single app.',
            ),
          ],
        ),
      ],
    );
  }
}
