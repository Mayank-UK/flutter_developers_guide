import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class OffStageWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/off_stage_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'OffStage',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _OffStageWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _OffStageWidgetImplementation extends StatefulWidget {
  @override
  __OffStageWidgetImplementationState createState() =>
      __OffStageWidgetImplementationState();
}

class __OffStageWidgetImplementationState
    extends State<_OffStageWidgetImplementation> {
  bool _isToggled = false;

  void onPressed() {
    setState(() {
      _isToggled = !_isToggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Offstage hides a child from view while keeping it in the tree. When offstage is true the child is still measured and laid out (so its state is preserved and animations continue) but it is neither painted nor hit-testable and takes no room in the parent.',
            ),
            TextBlock(
              'Use it to keep a child\'s state alive while temporarily hiding it (for example, a video player you pause-but-keep, or a form being stepped through). If you also want to skip laying the child out entirely, Visibility(with maintainState: true) or conditional inclusion in the build is usually clearer.',
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Offstage(
                      offstage: this._isToggled,
                      child: Container(
                        color: Colors.amber,
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: this.onPressed,
                    child: Text('Toggle offstage value.'),
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
