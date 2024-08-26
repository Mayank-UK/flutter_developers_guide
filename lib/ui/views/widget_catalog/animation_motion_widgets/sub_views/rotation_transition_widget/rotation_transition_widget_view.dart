import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class RotationTransitionWidgetView extends StatelessWidget {
  final String _appBarTitle = 'RotationTransition';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/rotation_transition_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _RotationTransitionImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _RotationTransitionImplementation extends StatefulWidget {
  @override
  __RotationTransitionImplementationState createState() =>
      __RotationTransitionImplementationState();
}

class __RotationTransitionImplementationState
    extends State<_RotationTransitionImplementation>
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
              '"RotationTransition" widget has named parameters like turns, etc, to specify the animation.',
            ),
            Container(
              child: RotationTransition(
                turns: CurvedAnimation(
                  parent: _controller,
                  curve: Curves.elasticOut,
                ),
                child: FlutterLogo(
                  size: 64,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
