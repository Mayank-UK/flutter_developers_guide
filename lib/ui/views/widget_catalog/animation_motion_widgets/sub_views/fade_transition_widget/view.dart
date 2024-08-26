import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class FadeTransitionWidgetView extends StatelessWidget {
  final String _appBarTitle = 'FadeTransition';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/fade_transition_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _FadeTransitionImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _FadeTransitionImplementation extends StatefulWidget {
  @override
  __FadeTransitionImplementationState createState() =>
      __FadeTransitionImplementationState();
}

class __FadeTransitionImplementationState
    extends State<_FadeTransitionImplementation> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
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
              '"FadeTransition" widget has named parameters like opacity, etc, which specify the animation.',
            ),
            Container(
              child: FadeTransition(
                opacity: CurvedAnimation(
                  parent: _controller,
                  curve: Curves.easeIn,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: FlutterLogo(
                    size: 64,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
