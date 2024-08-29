import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class HeroWidgetView extends StatelessWidget {
  final String _appBarTitle = 'Hero';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/hero_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      mobileUi: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
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
              '"Hero" widget animates an item from one screen to another screen, if both screen\'s have a "Hero" widget.',
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
        Navigator.pop(context);
      },
    );
  }
}
