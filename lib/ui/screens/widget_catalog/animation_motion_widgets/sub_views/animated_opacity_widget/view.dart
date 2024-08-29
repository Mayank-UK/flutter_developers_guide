import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AnimatedOpacityWidgetView extends StatelessWidget {
  final String _appBarTitle = 'AnimatedOpacity';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/animated_opacity_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      mobileUi: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _AnimatedOpacityImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _AnimatedOpacityImplementation extends StatefulWidget {
  @override
  __AnimatedOpacityImplementationState createState() =>
      __AnimatedOpacityImplementationState();
}

class __AnimatedOpacityImplementationState
    extends State<_AnimatedOpacityImplementation> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"AnimatedOpacity" widget has named parameters like "opacity", "duration", etc to specify the animation.',
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedOpacity(
                    opacity: opacityLevel,
                    duration: Duration(seconds: 1),
                    child: FlutterLogo(
                      size: 64,
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
