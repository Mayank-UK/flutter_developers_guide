import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'dart:math' as math;

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AnimatedBuilderWidgetView extends StatelessWidget {
  final String _appBarTitle = 'AnimatedBuilder';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/animated_builder_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      mobileUi: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _AnimatedBuilderWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _AnimatedBuilderWidgetImplementation extends StatefulWidget {
  @override
  __AnimatedBuilderWidgetImplementationState createState() =>
      __AnimatedBuilderWidgetImplementationState();
}

class __AnimatedBuilderWidgetImplementationState
    extends State<_AnimatedBuilderWidgetImplementation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    this._controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
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
            TextBlock('AnimatedBuilder widget'),
            Container(
              child: AnimatedBuilder(
                animation: _controller,
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.amber,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text('Whee!'),
                  ),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi,
                    child: child,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
