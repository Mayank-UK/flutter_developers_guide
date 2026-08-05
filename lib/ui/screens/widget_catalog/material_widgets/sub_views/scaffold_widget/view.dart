import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ScaffoldWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/scaffold_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Scaffold',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _ScaffoldWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ScaffoldWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Scaffold is the basic page layout of Material Design. It provides the standard slots — appBar across the top, body in the middle, bottomNavigationBar or NavigationBar at the bottom, floatingActionButton hovering, drawer sliding from the side — and the APIs that coordinate them (showSnackBar, showBottomSheet, openDrawer).',
            ),
            TextBlock(
              'You almost always place a Scaffold at the root of a route. Its descendants read theme, MediaQuery, and directionality from context, and the ScaffoldMessenger ancestor handles SnackBars so they survive route changes without leaking across screens.',
            ),
            TextBlock(
              'Tip: nest Scaffolds sparingly. For an inner detail area that needs its own AppBar, prefer a CustomScrollView with a SliverAppBar over a second Scaffold — nested Scaffolds double up the back-button logic and the SnackBar queue.',
            ),
          ],
        ),
      ],
    );
  }
}
