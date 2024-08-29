import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class OffStageWidgetView extends StatelessWidget {
  final String _appBarTitle = 'OffStage';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/off_stage_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      mobileUi: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
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
              '"Offstage" widget has a named parameter offstage, which specify the visibility of it\'s child.',
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
