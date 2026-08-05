import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ScaleTransitionWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/scale_transition_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'ScaleTransition',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _ScaleTransitionImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ScaleTransitionImplementation extends StatefulWidget {
  @override
  __ScaleTransitionImplementationState createState() =>
      __ScaleTransitionImplementationState();
}

class __ScaleTransitionImplementationState
    extends State<_ScaleTransitionImplementation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'ScaleTransition scales its child by the factor given by an Animation<double> — 1.0 is the natural size, 0.0 shrinks it to nothing. Drive it from a controller (often wrapped in a CurvedAnimation) and the child grows or shrinks along that timeline.',
            ),
            TextBlock(
              'Set alignment to control the scale\'s origin (center by default). It is the explicit-animation way to do a pop-in / press feedback; for a one-off implicit scale on a state change, reach for an AnimatedScale instead.',
            ),
            Container(
              child: ScaleTransition(
                scale: CurvedAnimation(
                  parent: _controller,
                  curve: Curves.fastOutSlowIn,
                ),
                child: FlutterLogo(size: 64),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
