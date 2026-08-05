import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AnimatedWidgetBaseStateWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/animated_widget_base_state_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'AnimatedWidgetBaseState',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _AnimatedWidgetBaseStateImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _AnimatedWidgetBaseStateImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'ImplicitlyAnimatedWidgetState is the State base class behind every "AnimatedX" implicit-animation widget — AnimatedContainer, AnimatedAlign, AnimatedOpacity and friends. It runs a single forward AnimationController each time a property changes and drives a tween from the old value to the new one.',
            ),
            TextBlock(
              'You rarely touch it directly: app code uses the AnimatedX widgets, and they internally lean on this state to start and stop the implicit animation. Subclass it only if you are authoring your own ImplicitlyAnimatedWidget with a custom interpolable property.',
            ),
          ],
        ),
      ],
    );
  }
}
