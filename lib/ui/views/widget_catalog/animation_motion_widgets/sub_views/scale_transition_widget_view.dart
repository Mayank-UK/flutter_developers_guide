import 'package:flutter/material.dart';

import '../../../../components/code_preview_component.dart';
import '../../../../components/section_wrapper_component_component.dart';
import '../../../../components/text_block_component.dart';

class ScaleTransitionWidgetView extends StatelessWidget {
  final String _appBarTitle = 'ScaleTransition';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/scale_transition_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabsComponent(
      appBarTitle: this._appBarTitle,
      previewTab: _ScaleTransitionImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
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
        SectionWrapperComponent(
          title: 'Simple use',
          content: [
            TextBlockComponent(
              '"ScaleTransition" widget has named parameters like scale, etc, which specify the animation.',
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
