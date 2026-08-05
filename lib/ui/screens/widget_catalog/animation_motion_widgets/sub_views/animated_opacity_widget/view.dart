import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AnimatedOpacityWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/animated_opacity_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'AnimatedOpacity',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _AnimatedOpacityImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _AnimatedOpacityImplementation extends StatefulWidget {
  @override
  __AnimatedOpacityImplementationState createState() =>
      __AnimatedOpacityImplementationState();
}

class __AnimatedOpacityImplementationState
    extends State<_AnimatedOpacityImplementation> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'AnimatedOpacity tweens its child\'s transparency whenever the `opacity` value changes between rebuilds — the simplest way to fade a widget in or out without an AnimationController. Set the new value in setState and it animates over `duration`.',
            ),
            TextBlock(
              'For the common "fade in on mount" case this is usually all you need. If you are driving opacity from an ongoing Animation (say, tied to a scroll offset), use FadeTransition instead so a single controller can feed multiple transitions efficiently.',
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedOpacity(
                    opacity: opacityLevel,
                    duration: Duration(seconds: 1),
                    child: FlutterLogo(
                      size: 64,
                    ),
                  ),
                  ElevatedButton(
                    child: Text('Toggle logo opacity'),
                    onPressed: _changeOpacity,
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
