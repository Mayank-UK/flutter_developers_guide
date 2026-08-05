import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';
import '../../../../../../../components/text_block.dart';

class ClickBehaviorView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/interactive_behaviours/click_behavior_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Click/tap behavior',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _ClickBehaviorImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ClickBehaviorImplementation extends StatelessWidget {
  void onTap(BuildContext context) {
    final SnackBar snackBar =
        SnackBar(content: const Text('Click/tap registered'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Using "InkWell" widget',
          content: [
            TextBlock(
              '"InkWell" attaches tap, double-tap, and long-press handlers to any widget and paints the Material ink splash ripple on top of a nearby "Material" ancestor. Use it to make custom containers, cards, and list tiles feel tappable.',
            ),
            TextBlock(
              'Gotcha: the ripple only shows if a "Material" widget is in the ancestry — wrapping a child in a colored "Container" that is not on a Material surface will clip the splash. For purely hit-testing without ink, use "GestureDetector" instead.',
            ),
            InkWell(
              onTap: () => onTap(context),
              child: Container(
                alignment: Alignment.center,
                color: Colors.amber,
                height: 50,
                width: 50,
                child: const Text('Click'),
              ),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Using "GestureDetector" widget',
          content: [
            TextBlock(
              '"GestureDetector" is the no-paint sibling of "InkWell": it exposes a rich set of gestures (tap, drag, scale, long-press, pan) without any visual ripple, so it is ideal over images, custom painters, or already-themed surfaces.',
            ),
            TextBlock(
              'Because it has no visual chrome, you should give the user feedback another way — "AnimatedScale", a color tween, or a down-state — so taps don\'t feel dead.',
            ),
            GestureDetector(
              onTap: () => onTap(context),
              child: Container(
                alignment: Alignment.center,
                color: Colors.amber,
                height: 50,
                width: 50,
                child: const Text('Click'),
              ),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Using different button widgets',
          content: [
            TextBlock(
              'Flutter\'s button family — "ElevatedButton", "FilledButton", "OutlinedButton", "TextButton", and "FloatingActionButton" — all expose an "onPressed" callback and inherit their colors and shape from the theme.',
            ),
            TextBlock(
              'Passing "onPressed: null" disables the button and greys it out automatically, so toggling the callback is the canonical way to reflect "this action is unavailable right now" (e.g. form not yet valid).',
            ),
            Wrap(
              direction: Axis.horizontal,
              runSpacing: 8,
              spacing: 8,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => onTap(context),
                  child: const Text('Click'),
                ),
                FloatingActionButton(
                  onPressed: () => onTap(context),
                  child: const Text('Click'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
