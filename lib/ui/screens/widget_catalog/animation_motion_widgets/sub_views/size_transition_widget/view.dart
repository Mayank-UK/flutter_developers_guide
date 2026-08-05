import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class SizeTransitionWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/animation_motion/size_transition_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'SizeTransition',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _SizeTransitionImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _SizeTransitionImplementation extends StatefulWidget {
  @override
  __SizeTransitionImplementationState createState() =>
      __SizeTransitionImplementationState();
}

class __SizeTransitionImplementationState
    extends State<_SizeTransitionImplementation> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'SizeTransition grows or shrinks its child along one axis (vertical by default) based on sizeFactor, an Animation<double> where 1.0 is full size and 0.0 is collapsed. It clips and aligns the child during the transition, so the surrounding layout animates smoothly.',
            ),
            TextBlock(
              'Use it for expand/collapse sections, drawer sub-panels, and "show more" disclosures. Set axis to the direction you want to collapse and axisAlignment to decide which edge stays fixed during the resize. It is the explicit-animation sibling of AnimatedSize.',
            ),
            Container(
              child: SizeTransition(
                sizeFactor: CurvedAnimation(
                  parent: _controller,
                  curve: Curves.fastOutSlowIn,
                ),
                axis: Axis.horizontal,
                axisAlignment: -1,
                child: FlutterLogo(size: 64),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
