import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class OpacityWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/painting_effects/opacity_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Opacity',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _OpacityWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _OpacityWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Opacity makes its child semi-transparent, blending it with whatever sits behind at the given 0.0–1.0 value. Use it to fade content in and out, or to layer translucent overlays on top of background content.',
            ),
            TextBlock(
              'Opacity relies on a save-layer, which is relatively costly, so prefer FadeTransition or AnimatedOpacity for fade animations. For the special case of hiding fully (opacity 0.0), Visibility or conditionally omitting the widget is cheaper — plain Opacity still builds and lays out an invisible child.',
            ),
            Container(
              color: Colors.amber,
              padding: const EdgeInsets.all(16),
              child: FractionalTranslation(
                translation: Offset(0.5, 0),
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
