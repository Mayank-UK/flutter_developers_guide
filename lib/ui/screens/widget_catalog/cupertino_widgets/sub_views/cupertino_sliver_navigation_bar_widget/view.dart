import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoSliverNavigationBarWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'CupertinoSliverNavigationBar',
      markdownPath: 'assets/markdowns/widget_catalog/cupertino/cupertino_sliver_navigation_bar_markdown.md',
      preview: _CupertinoSliverNavigationBarWidgetImplementation(),
    );
  }
}

class _CupertinoSliverNavigationBarWidgetImplementation
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoSliverNavigationBar is the sliver version of CupertinoNavigationBar with iOS 11 large-title support. Because it\'s a sliver, the large title expands and collapses in concert with the scrollable content below it.',
            ),
            TextBlock(
              'Place it as the first sliver of a CustomScrollView; pair it with CupertinoSliverRefreshControl for pull-to-refresh. Set stretch: true so the large title stretches under overscroll — a small touch that makes the page feel fully native iOS.',
            ),
          ],
        ),
      ],
    );
  }
}
