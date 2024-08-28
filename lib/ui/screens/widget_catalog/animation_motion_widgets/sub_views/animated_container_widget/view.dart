import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AnimatedContainerWidgetView extends StatelessWidget {
  final String _appBarTitle = 'AnimatedContainer';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/animated_container_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
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
              '"AnimatedContainer" widget has named parameters like "width", "height", "color", etc that will animate the container.',
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
