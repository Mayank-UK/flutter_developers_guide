import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AnimatedPhysicalModelWidgetView extends StatelessWidget {
  final String _appBarTitle = 'AnimatedPhysicalModel';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/animated_physical_model_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
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
              '"AnimatedOpacity" widget has named parameters like "opacity", "duration", etc to specify the animation.',
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
