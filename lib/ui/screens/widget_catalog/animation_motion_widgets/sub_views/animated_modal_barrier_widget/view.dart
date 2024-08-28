import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AnimatedModalBarrierWidgetView extends StatelessWidget {
  final String _appBarTitle = 'AnimatedModalBarrier';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/animated_modal_barrier_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _AnimatedModalBarrierImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _AnimatedModalBarrierImplementation extends StatefulWidget {
  @override
  __AnimatedModalBarrierImplementationState createState() =>
      __AnimatedModalBarrierImplementationState();
}

class __AnimatedModalBarrierImplementationState
    extends State<_AnimatedModalBarrierImplementation>
    with SingleTickerProviderStateMixin {
  bool _isToggled = false;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
    );
  }

  void onPressed() {
    setState(() {
      this._isToggled = !this._isToggled;
    });

    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"AnimatedModalBarrier" has a named parameter "color" which is of type "Animation<Color>".',
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100.0,
                    width: 250.0,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: this.onPressed,
                          child: Text('Tap to toggle modal barrier'),
                        ),
                        this._isToggled
                            ? AnimatedModalBarrier(
                                color: ColorTween(
                                  begin: Color.fromARGB(100, 255, 255, 255),
                                  end: Color.fromARGB(100, 127, 127, 127),
                                ).animate(_animationController),
                                dismissible: false,
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: this.onPressed,
                    child: Text('Tap to toggle modal barrier'),
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
