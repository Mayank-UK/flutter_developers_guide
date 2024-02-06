import 'package:flutter/material.dart';

import '../../../../components/code_preview_component.dart';
import '../../../../components/section_wrapper_component_component.dart';
import '../../../../components/text_block_component.dart';

class SlideTransitionWidgetView extends StatelessWidget {
  final String _appBarTitle = 'SlideTransition';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/slide_transition_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabsComponent(
      appBarTitle: this._appBarTitle,
      previewTab: _SizeTransitionImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _SizeTransitionImplementation extends StatefulWidget {
  @override
  __SizeTransitionImplementationState createState() =>
      __SizeTransitionImplementationState();
}

class __SizeTransitionImplementationState
    extends State<_SizeTransitionImplementation> with TickerProviderStateMixin {
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
        SectionWrapperComponent(
          title: 'Simple use',
          content: [
            TextBlockComponent(
              '"SizeTransition" widget has named parameters like sizeFactor, axis, axisAlignment, etc, which specify the animation.',
            ),
            Container(
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(1.5, 0.0),
                ).animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: Curves.elasticIn,
                  ),
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
