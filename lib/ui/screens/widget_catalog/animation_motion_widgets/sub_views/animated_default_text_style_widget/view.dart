import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AnimatedDefaultTextStyleWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/animated_default_text_style_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'AnimatedDefaultTextStyle',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _AnimatedDefaultTextStyleWidgetImplementatio(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _AnimatedDefaultTextStyleWidgetImplementatio extends StatefulWidget {
  @override
  __AnimatedDefaultTextStyleWidgetImplementatioState createState() =>
      __AnimatedDefaultTextStyleWidgetImplementatioState();
}

class __AnimatedDefaultTextStyleWidgetImplementatioState
    extends State<_AnimatedDefaultTextStyleWidgetImplementatio> {
  bool isToggled = false;

  void onPressed() {
    setState(() {
      isToggled = !isToggled;
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
              '',
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: this.isToggled
                          ? TextStyle(fontSize: 30)
                          : TextStyle(fontSize: 50),
                      child: Text('Flutter'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: this.onPressed,
                    child: Text('Animated text style'),
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
