import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AnimatedListStateWidgetView extends StatelessWidget {
  final String _appBarTitle = 'AnimatedListState';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/animated_list_state_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _AnimatedListStateImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
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
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Will be updated soon',
            ),
          ],
        ),
      ],
    );
  }
}
