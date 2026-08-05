import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AnimatedListStateWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/animated_list_state_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'AnimatedListState',
      mobileUi: [
        CodePreviewTabs(
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
              'AnimatedList is a ListView whose individual items animate in and out when you insert or remove them, rather than popping abruptly. You drive it through its AnimatedListState (obtained via a GlobalKey), calling insertItem and removeItem with the index and a builder that constructs the item for each animation phase.',
            ),
            TextBlock(
              'The remove flow needs a builder that can render the departing item even after it is gone from your model, so the exit animation can run. It is the right choice when list mutations are user-visible events (chat messages arriving, tasks being completed); for lists that change silently, a plain ListView is simpler.',
            ),
          ],
        ),
      ],
    );
  }
}
