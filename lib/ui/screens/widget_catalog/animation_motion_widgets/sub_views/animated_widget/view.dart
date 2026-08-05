import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AnimatedWidgetWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/animated_widget_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'AnimatedWidget',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _AnimatedWidgetWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _AnimatedWidgetWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'AnimatedWidget is the base class for widgets that rebuild automatically when a Listenable (an Animation, ChangeNotifier, or ValueNotifier) ticks. Subclass it, store the listenable in a field, and override build to read the current value — Flutter handles the addListener/removeListener plumbing for you.',
            ),
            TextBlock(
              'The framework\'s own Transition widgets (FadeTransition, RotationTransition, etc.) are built on AnimatedWidget, and so is AnimatedBuilder. Reach for it directly when you want a small, reusable widget that turns an animation into UI without the boilerplate of a StatefulWidget + controller wiring.',
            ),
          ],
        ),
      ],
    );
  }
}
