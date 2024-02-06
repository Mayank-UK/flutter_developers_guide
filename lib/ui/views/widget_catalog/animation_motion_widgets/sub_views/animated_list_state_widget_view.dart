import 'package:flutter/material.dart';

import '../../../../components/code_preview_component.dart';
import '../../../../components/section_wrapper_component_component.dart';
import '../../../../components/text_block_component.dart';

class AnimatedListStateWidgetView extends StatelessWidget {
  final String _appBarTitle = 'AnimatedListState';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/animated_list_state_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabsComponent(
      appBarTitle: this._appBarTitle,
      previewTab: _AnimatedListStateImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _AnimatedListStateImplementation extends StatefulWidget {
  @override
  __AnimatedListStateImplementationState createState() =>
      __AnimatedListStateImplementationState();
}

class __AnimatedListStateImplementationState
    extends State<_AnimatedListStateImplementation>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapperComponent(
          title: 'Simple use',
          content: [
            TextBlockComponent(
              'Will be updated soon',
            ),
          ],
        ),
      ],
    );
  }
}
