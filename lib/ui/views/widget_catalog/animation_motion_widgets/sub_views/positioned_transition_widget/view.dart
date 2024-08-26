import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class PositionedTransitionWidgetView extends StatelessWidget {
  final String _appBarTitle = 'PositionedTransition';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/positioned_transition_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _PositionedTransitionImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _PositionedTransitionImplementation extends StatefulWidget {
  @override
  __PositionedTransitionImplementationState createState() =>
      __PositionedTransitionImplementationState();
}

class __PositionedTransitionImplementationState
    extends State<_PositionedTransitionImplementation>
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
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"PositionedTransition" widget has named parameters like rect, etc, which specify the animation.',
            ),
            Container(
              height: 400,
              child: Stack(
                children: [
                  PositionedTransition(
                    rect: RelativeRectTween(
                      begin: RelativeRect.fromSize(
                        Rect.fromLTWH(0, 0, 64, 64),
                        Size(64, 64),
                      ),
                      end: RelativeRect.fromSize(
                        Rect.fromLTWH(50, 50, 32, 32),
                        Size(32, 32),
                      ),
                    ).animate(
                      CurvedAnimation(
                        parent: _controller,
                        curve: Curves.easeInOut,
                      ),
                    ),
                    child: FlutterLogo(
                      size: 64,
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
