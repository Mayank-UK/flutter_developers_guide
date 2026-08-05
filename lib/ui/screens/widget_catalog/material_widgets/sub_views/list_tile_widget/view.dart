import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ListTileWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'ListTile',
      markdownPath: 'assets/markdowns/widget_catalog/material/list_tile_markdown.md',
      preview: _ListTileWidgetImplementation(),
    );
  }
}

class _ListTileWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'ListTile is a single fixed-height Material row that lays out the classic leading / title / subtitle / trailing pattern — a leading icon or avatar on the left, a two-line text block in the middle, and an optional trailing widget (a chevron, a switch, a count) on the right.',
            ),
            TextBlock(
              'It is the building block for almost every list in a Material app — menus, settings pages, inbox rows. Used inside a ListView it gives you taps, ink splash, and consistent heights for free; you only supply the content of each slot.',
            ),
            TextBlock(
              'Gotcha: a ListTile is a single hardcoded height and will overflow if you put tall children (a 100×100 avatar, multi-line text) in it. For richer content use a custom Row inside a Card, or switch to the more flexible ListTile variants only where they actually fit.',
            ),
            Container(
              color: Colors.amber,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    child: ListTile(
                      leading: FlutterLogo(),
                      title: const Text('ListTile'),
                    ),
                  ),
                  Container(
                    child: ListTile(
                      trailing: FlutterLogo(),
                      title: const Text('ListTile'),
                    ),
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
