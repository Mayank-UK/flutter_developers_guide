import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AnimatedCrossFadeWidgetView extends StatelessWidget {
  final String _appBarTitle = 'AnimatedCrossFade';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/animated_cross_fade_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _AnimatedCrossFadeImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _AnimatedCrossFadeImplementation extends StatefulWidget {
  @override
  __AnimatedCrossFadeImplementationState createState() =>
      __AnimatedCrossFadeImplementationState();
}

class __AnimatedCrossFadeImplementationState
    extends State<_AnimatedCrossFadeImplementation> {
  bool isToggled = false;

  void onPressed() {
    setState(() {
      isToggled = !isToggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"AnimatedCrossFade" widget has named parameters "firstChild", "secondChild", "crossFade", etc which help in animating the fade animation.',
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: AnimatedCrossFade(
                      duration: const Duration(seconds: 3),
                      firstChild: const FlutterLogo(
                          style: FlutterLogoStyle.horizontal, size: 100.0),
                      secondChild: const FlutterLogo(
                          style: FlutterLogoStyle.stacked, size: 100.0),
                      crossFadeState: this.isToggled
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: this.onPressed,
                    child: Text('Animate cross fade'),
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
