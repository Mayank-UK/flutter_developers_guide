import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class IgnorePointerWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/interactive/ignore_pointer_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'IgnorePointer',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _IgnorePointerWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _IgnorePointerWidgetImplementation extends StatefulWidget {
  @override
  __IgnorePointerWidgetImplementationState createState() =>
      __IgnorePointerWidgetImplementationState();
}

class __IgnorePointerWidgetImplementationState
    extends State<_IgnorePointerWidgetImplementation> {
  bool _isToggled = false;

  void onPressed() {
    setState(() {
      this._isToggled = !this._isToggled;
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
              'IgnorePointer makes itself and its subtree invisible to hit-testing when ignoring is true — pointer events simply pass through to whatever sits underneath. The child still paints and lays out normally; only interaction is suppressed.',
            ),
            TextBlock(
              'It differs from AbsorbPointer: AbsorbPointer swallows the event (the parent underneath never sees it), while IgnorePointer lets the event continue to the widget behind. Use it for decorative overlays — a hint badge, an annotation layer — that should look present but never intercept taps on the content below.',
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    child: Stack(
                      children: [
                        IgnorePointer(
                          ignoring: this._isToggled,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Ignore pointer set to: ${this._isToggled}',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: this.onPressed,
                    child: Text('Tap to toggle ignore pointer'),
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
