import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class DecoratedBoxTransitionWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/decorated_box_transition_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'DecoratedBoxTransition',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _DecoratedBoxTransitionImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _DecoratedBoxTransitionImplementation extends StatefulWidget {
  @override
  __DecoratedBoxTransitionImplementationState createState() =>
      __DecoratedBoxTransitionImplementationState();
}

class __DecoratedBoxTransitionImplementationState
    extends State<_DecoratedBoxTransitionImplementation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'DecoratedBoxTransition animates between two BoxDecoration values (begin and end) using a DecorationTween driven by an Animation. Unlike AnimatedDecoratedBox, which tweens implicitly on rebuild, this one is an explicit transition — you own the controller, so the shadow, border-radius, color, and shape all lerp together along your timeline.',
            ),
            TextBlock(
              'Not every property of BoxDecoration can interpolate cleanly (shadows and gradients have rules about what pairs can lerp), so check that your begin/end decorations are compatible or the transition will throw. Use it for hero-style decoration morphs gated on a controller value.',
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DecoratedBoxTransition(
                    position: DecorationPosition.background,
                    decoration: DecorationTween(
                      begin: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        border: Border.all(style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(60.0),
                        shape: BoxShape.rectangle,
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            color: Color(0x66666666),
                            blurRadius: 10.0,
                            spreadRadius: 3.0,
                            offset: Offset(0, 6.0),
                          )
                        ],
                      ),
                      end: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        border: Border.all(
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.zero,
                        // No shadow.
                      ),
                    ).animate(_controller),
                    child: Container(
                      width: 200,
                      height: 200,
                      padding: const EdgeInsets.all(10),
                      child: const FlutterLogo(),
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
