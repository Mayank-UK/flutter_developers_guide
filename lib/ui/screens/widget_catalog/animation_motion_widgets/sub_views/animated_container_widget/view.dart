import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AnimatedContainerWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/animated_container_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'AnimatedContainer',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _AnimatedContainerImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _AnimatedContainerImplementation extends StatefulWidget {
  @override
  __AnimatedContainerImplementationState createState() =>
      __AnimatedContainerImplementationState();
}

class __AnimatedContainerImplementationState
    extends State<_AnimatedContainerImplementation> {
  bool _selected = false;

  void onPressed() {
    setState(() {
      _selected = !_selected;
    });
  }

  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'AnimatedContainer tweens its decoration, padding, margin, alignment, width, height — any property Container accepts — whenever those values change between rebuilds. It is the quickest way to lerp a widget\'s look: just call setState with the new values and AnimatedContainer handles the rest.',
            ),
            TextBlock(
              'It is an implicit animation, so each animatable property interpolates linearly (or via `curve`) over `duration`; you never touch an AnimationController. That convenience comes at the cost of fine-grained control — for sequenced or staggered motion, compose an explicit AnimationController + AnimatedBuilder/Tween instead.',
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: AnimatedContainer(
                      width: _selected ? 200.0 : 100.0,
                      height: _selected ? 100.0 : 200.0,
                      color: _selected ? Colors.red : Colors.blue,
                      alignment: _selected
                          ? Alignment.center
                          : AlignmentDirectional.topCenter,
                      duration: const Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn,
                      child: const FlutterLogo(size: 75),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: this.onPressed,
                    child: Text('Animate container'),
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
