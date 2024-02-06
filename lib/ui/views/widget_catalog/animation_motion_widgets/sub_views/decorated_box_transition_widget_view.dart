import 'package:flutter/material.dart';

import '../../../../components/code_preview_component.dart';
import '../../../../components/section_wrapper_component_component.dart';
import '../../../../components/text_block_component.dart';

class DecoratedBoxTransitionWidgetView extends StatelessWidget {
  final String _appBarTitle = 'DecoratedBoxTransition';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/decorated_box_transition_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabsComponent(
      appBarTitle: this._appBarTitle,
      previewTab: _DecoratedBoxTransitionImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
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
        SectionWrapperComponent(
          title: 'Simple use',
          content: [
            TextBlockComponent(
              '"DecoratedBoxTransition" widget has named parameters like position, decoration, etc, which specify the animation.',
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
