import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class HeroWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/hero_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Hero',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _HeroWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _HeroWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Hero marks a widget as a shared element: when navigating between two routes that each contain a Hero with the same `tag`, Flutter flies the child from its position on the source route to its position on the destination route, morphing size and shape along the way. It\'s the canonical "tap a thumbnail, expand to full-screen image" transition.',
            ),
            TextBlock(
              'The tag must be unique per route pair — duplicate tags throw. For the flight to look right, the child on both sides should be the same kind of widget (an Image, a Container) so the rect-and-content morph reads as one element moving. Use flightShuttleBuilder when you need a custom in-flight widget instead of the source/destination children.',
            ),
            Container(
              child: _MainScreen(),
            ),
          ],
        ),
      ],
    );
  }
}

class _MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Hero(
        tag: 'imageHero',
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            'https://picsum.photos/250?image=9',
            height: 100,
            width: 100,
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return _SecondaryScreen();
        }));
      },
    );
  }
}

class _SecondaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Hero(
          tag: 'imageHero',
          child: Image.network(
            'https://picsum.photos/250?image=9',
          ),
        ),
      ),
      onTap: () {
        context.pop();
      },
    );
  }
}
