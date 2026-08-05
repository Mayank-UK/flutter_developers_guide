import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class BottomNavigationBarWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'BottomNavigationBar',
      markdownPath: 'assets/markdowns/widget_catalog/material/bottom_navigation_bar_markdown.md',
      preview: _BottomNavigationBarWidgetImplementation(),
    );
  }
}

class _BottomNavigationBarWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'BottomNavigationBar is a Material bar pinned at the bottom of the Scaffold that lets users switch between the top-level destinations of an app in a single tap. Each destination is a BottomNavigationBarItem with an icon and a label.',
            ),
            TextBlock(
              'Use it when you have 3 to 5 equally important destinations; the selected item is highlighted via currentIndex, and onTap drives state. With more than five destinations, prefer a NavigationRail (tablet/desktop) or a NavigationBar (Material 3) instead.',
            ),
            TextBlock(
              'Gotcha: it deliberately does not keep state for each tab\'s body — pair it with an IndexedStack (or a PageView) so switching tabs does not rebuild and lose scroll position.',
            ),
            Container(
              child: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.ac_unit,
                    ),
                    label: 'item_1',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.ac_unit,
                    ),
                    label: 'item_2',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.ac_unit,
                    ),
                    label: 'item_3',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
