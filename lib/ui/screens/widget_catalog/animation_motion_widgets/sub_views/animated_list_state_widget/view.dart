import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AnimatedListStateWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'AnimatedListState',
      markdownPath: 'assets/markdowns/widget_catalog/animation_motion/animated_list_state_markdown.md',
      preview: _AnimatedListStateImplementation(),
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
