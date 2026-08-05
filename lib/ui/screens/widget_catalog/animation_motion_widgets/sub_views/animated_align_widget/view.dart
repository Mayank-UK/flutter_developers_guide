import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AnimatedAlignWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/animated_align_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'AnimatedAlign',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _AnimatedAlignWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _AnimatedAlignWidgetImplementation extends StatefulWidget {
  @override
  __AnimatedAlignWidgetImplementationState createState() =>
      __AnimatedAlignWidgetImplementationState();
}

class __AnimatedAlignWidgetImplementationState
    extends State<_AnimatedAlignWidgetImplementation> {
  AlignmentGeometry _alignment = Alignment.topRight;

  void _changeAlignment() {
    setState(() {
      _alignment = _alignment == Alignment.topRight
          ? Alignment.bottomLeft
          : Alignment.topRight;
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
                'AnimatedAlign is the implicit-animation twin of Align: pass it a new alignment and it tweens the child from the old position to the new one over `duration`, using `curve` for the easing. No AnimationController required — just rebuild with a different value.'),
            TextBlock(
              'Like the other AnimatedX widgets, it only animates when the alignment actually changes between rebuilds. It is ideal for one-off transitions driven by state (a toggle, a selection); for continuous or choreographed motion use an explicit Align + Transition driven by an AnimationController instead.',
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 120.0,
                    width: 120.0,
                    color: Colors.blue[50],
                    child: AnimatedAlign(
                      alignment: _alignment,
                      curve: Curves.ease,
                      duration: Duration(seconds: 3),
                      child: FlutterLogo(
                        size: 60,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      this._changeAlignment();
                    },
                    child: Text(
                      "Click Me!",
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
