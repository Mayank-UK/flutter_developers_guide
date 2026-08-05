import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class TabBarViewWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'TabBarView',
      markdownPath: 'assets/markdowns/widget_catalog/material/tab_bar_view_markdown.md',
      preview: _TabBarViewWidgetImplementation(),
    );
  }
}

class _TabBarViewWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'TabBarView is the swipeable page container that pairs with TabBar: it shows the children in the same order as the tabs, and the user can either tap a tab or swipe horizontally to move between them. The selected tab and the current page stay in lockstep automatically.',
            ),
            TextBlock(
              'For the two widgets to stay coordinated they must share a TabController. The simplest path is to wrap both in a DefaultTabController with a length — it builds an internal controller and provides it to descendants, so you avoid managing animation state yourself.',
            ),
            TextBlock(
              'Gotcha: TabBarView uses a PageView under the hood and lazily builds children as they scroll into view. Each tab page keeps its own scroll state, so deep, stateful content per tab works without losing position on swipe.',
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
