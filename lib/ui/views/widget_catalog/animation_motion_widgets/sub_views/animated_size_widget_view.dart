import 'package:flutter/material.dart';

import '../../../../components/code_preview_component.dart';
import '../../../../components/section_wrapper_component_component.dart';
import '../../../../components/text_block_component.dart';

class AnimatedSizeWidgetView extends StatelessWidget {
  final String _appBarTitle = 'AnimatedSize';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/animated_size_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabsComponent(
      appBarTitle: this._appBarTitle,
      previewTab: _AnimatedSizeImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _AnimatedSizeImplementation extends StatefulWidget {
  @override
  __AnimatedSizeImplementationState createState() =>
      __AnimatedSizeImplementationState();
}

class __AnimatedSizeImplementationState
    extends State<_AnimatedSizeImplementation>
    with SingleTickerProviderStateMixin {
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
        SectionWrapperComponent(
          title: 'Simple use',
          content: [
            TextBlockComponent(
              '"AnimatedSize" widget has named parameters like vsync, curve, duration, etc, which define the animation.',
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedSize(
                    curve: Curves.easeIn,
                    duration: const Duration(
                      seconds: 1,
                    ),
                    child: FlutterLogo(
                      size: _isToggled ? 24 : 64,
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
