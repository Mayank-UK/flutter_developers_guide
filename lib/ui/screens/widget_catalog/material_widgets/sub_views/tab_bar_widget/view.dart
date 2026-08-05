import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class TabBarWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'TabBar',
      markdownPath: 'assets/markdowns/widget_catalog/material/tab_bar_markdown.md',
      preview: _TabBarWidgetImplementation(),
    );
  }
}

class _TabBarWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'TabBar is a horizontal Material row of tabs that lets the user switch between sibling views. Each tab is a Tab widget (icon, text, or both); the active tab is marked with an animated indicator that slides between selections.',
            ),
            TextBlock(
              'For a TabBar to know which tab is selected it needs a TabController. The convenient path is to wrap the TabBar and its TabBarView in a DefaultTabController, which manages the controller for you; reach for an explicit TabController only when you need to drive the selection programmatically or listen to tab-change events.',
            ),
            TextBlock(
              'Tip: scrollable: true lets long sets of tabs page horizontally instead of being squashed, and TabBar is most often placed in the AppBar\'s bottom slot so it slides under the app bar in the standard Material layout.',
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
