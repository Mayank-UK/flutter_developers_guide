import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class PageViewWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'PageView',
      markdownPath: 'assets/markdowns/widget_catalog/scrolling/page_view_markdown.md',
      preview: _PageViewWidgetImplementation(),
    );
  }
}

class _PageViewWidgetImplementation extends StatelessWidget {
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'PageView is a scrollable that snaps its children into discrete full-screen pages, swiped one at a time horizontally or vertically. It\'s the basis for onboarding flows, image carousels, and tabbed content where each page is a complete widget.',
            ),
            TextBlock(
              'Drive it programmatically with a PageController, which also exposes the current page and animateToPage for jumps. For simple paged content inside a TabBar, TabBarView is the higher-level wrapper that stays in sync with a TabController.',
            ),
            Container(
              height: 500,
              color: Colors.white,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Text('First Page'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text('Second Page'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text('Third Page'),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
