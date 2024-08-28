import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AnimatedPositionedWidgetView extends StatelessWidget {
  final String _appBarTitle = 'AnimatedPositioned';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/animated_positioned_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _AnimatedPositionedImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _AnimatedPositionedImplementation extends StatefulWidget {
  @override
  __AnimatedPositionedImplementationState createState() =>
      __AnimatedPositionedImplementationState();
}

class __AnimatedPositionedImplementationState
    extends State<_AnimatedPositionedImplementation> {
  bool _isToggled = false;

  void onPressed() {
    setState(() {
      this._isToggled = !this._isToggled;
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
              '"AnimatedPositioned" widget has named parameters "height", "width", "top", etc to specify the animation.',
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          width: this._isToggled ? 200.0 : 50.0,
                          height: this._isToggled ? 50.0 : 200.0,
                          top: this._isToggled ? 150.0 : 50.0,
                          duration: const Duration(seconds: 2),
                          curve: Curves.fastOutSlowIn,
                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: this.onPressed,
                    child: Text('Tap to toggle animation'),
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
