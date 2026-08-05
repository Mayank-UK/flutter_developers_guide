import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class GridViewWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'GridView',
      markdownPath: 'assets/markdowns/widget_catalog/layout/grid_view_markdown.md',
      preview: _GridViewWidgetImplementation(),
    );
  }
}

class _GridViewWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'GridView is a scrollable 2D grid of widgets. It comes in several constructors: GridView.count (fixed number of columns), GridView.extent (max column width, columns auto-fit), GridView.builder (lazy building from an index), and GridView.custom (full SliverGridDelegate + SliverChildDelegate control).',
            ),
            TextBlock(
              'The grid is described by a SliverGridDelegate — crossAxisCount (or maxCrossAxisExtent), crossAxisSpacing, mainAxisSpacing, and childAspectRatio. Together they decide how many tiles fit per row and how tall each tile is.',
            ),
            TextBlock(
              'Tip: prefer GridView.builder over GridView.count when the list is large so tiles are built lazily as they scroll into view. Use shrinkWrap: true with NeverScrollableScrollPhysics when nesting a grid inside another scrollable, otherwise you will get viewport assertion errors.',
            ),
            Container(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: const EdgeInsets.all(20),
                primary: false,
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text("He'd have you all unravel at the"),
                    color: Colors.teal[100],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Heed not the rabble'),
                    color: Colors.teal[200],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Sound of screams but the'),
                    color: Colors.teal[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Who scream'),
                    color: Colors.teal[400],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Revolution is coming...'),
                    color: Colors.teal[500],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Revolution, they...'),
                    color: Colors.teal[600],
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
