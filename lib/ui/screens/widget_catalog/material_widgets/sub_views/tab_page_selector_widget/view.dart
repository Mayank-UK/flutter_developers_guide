import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class TabPageSelectorWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'TabPageSelector',
      markdownPath: 'assets/markdowns/widget_catalog/material/tab_page_selector_markdown.md',
      preview: _TabPageSelectorWidgetImplementation(),
    );
  }
}

class _TabPageSelectorWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'TabPageSelector renders a horizontal row of small dots — one per tab — with the currently selected tab\'s dot enlarged. It is a lightweight "you are on page X of Y" indicator, common in onboarding carousels and swipeable walkthroughs where there is no visible TabBar.',
            ),
            TextBlock(
              'Like TabBar, it reads its state from a TabController (a DefaultTabController works fine). Tap is purely informational — the dots do not navigate; pair it with a TabBarView and let swipes drive the selection.',
            ),
            TextBlock(
              'Tip: when you also show buttons like "Next" or "Skip" alongside the dots, call controller.animateTo on the button tap to keep the selector in sync with the page underneath.',
            ),
            Container(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Container(
                      color: Colors.blueGrey,
                      child: TabBar(
                        indicatorColor: Colors.black,
                        tabs: [
                          Tab(icon: Icon(Icons.directions_car)),
                          Tab(icon: Icon(Icons.directions_transit)),
                          Tab(icon: Icon(Icons.directions_bike)),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      height: 200,
                      child: TabBarView(
                        children: [
                          Icon(Icons.directions_car),
                          Icon(Icons.directions_transit),
                          Icon(Icons.directions_bike),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 16,
                      ),
                      child: TabPageSelector(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
