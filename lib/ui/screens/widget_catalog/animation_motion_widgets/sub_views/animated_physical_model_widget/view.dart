import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AnimatedPhysicalModelWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/animated_physical_model_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'AnimatedPhysicalModel',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _AnimatedPhysicalModelImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _AnimatedPhysicalModelImplementation extends StatefulWidget {
  @override
  __AnimatedPhysicalModelImplementationState createState() =>
      __AnimatedPhysicalModelImplementationState();
}

class __AnimatedPhysicalModelImplementationState
    extends State<_AnimatedPhysicalModelImplementation> {
  bool _isToggled = false;

  void _changeOpacity() {
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
              'AnimatedPhysicalModel tweens a PhysicalModel\'s elevation, color, shadowColor, and border-radius over `duration` whenever those values change between rebuilds. PhysicalModel renders its child with a real rounded shadow whose depth and spread follow the elevation, so animating elevation gives a convincing "lift off the page" effect.',
            ),
            TextBlock(
              'Use it for cards and tiles that should visually rise when selected or hovered, without manually orchestrating a shadow animation. Keep the elevation delta modest to avoid the shadow visibly jumping in discrete steps on some platforms.',
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedPhysicalModel(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    elevation: this._isToggled ? 0 : 16,
                    shape: BoxShape.rectangle,
                    shadowColor: Colors.black,
                    color: Colors.white,
                    child: Container(
                      height: 120.0,
                      width: 120.0,
                      color: Colors.blue[50],
                      child: FlutterLogo(
                        size: 60,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    child: Text('Toggle logo opacity'),
                    onPressed: _changeOpacity,
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
