import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';
import '../../../../../../../components/text_block.dart';

class HoverBehaviorView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/interactive_behaviours/hover_behavior_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Hover behavior',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _HoverBehaviorImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _HoverBehaviorImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'What hover is and when it matters',
          content: [
            TextBlock(
              'Hover is the pointer-resting state that desktop and web users produce just by moving the mouse over a widget. It is not a touch concept, so on phones it essentially never fires — design for it as a progressive enhancement, not a primary input.',
            ),
            TextBlock(
              'Use hover to telegraph clickability (cursor change, background tint, tooltip) and to reveal secondary actions on dense rows. The canonical widget is "MouseRegion", which reports "onEnter"/"onExit" and an "onHover" stream of pointer positions.',
            ),
            TextBlock(
              'Tip: pair "MouseRegion" with a "setState" (or a "ValueNotifier") to toggle a hover style, and gate cursor changes behind "kIsWeb" or platform checks so mobile builds stay lean. For built-in affordances, "InkWell" already responds to hover via "hoverColor".',
            ),
          ],
        ),
      ],
    );
  }
}
