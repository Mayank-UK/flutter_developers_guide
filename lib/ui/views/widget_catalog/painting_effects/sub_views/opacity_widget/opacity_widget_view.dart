import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class OpacityWidgetView extends StatelessWidget {
  final String _appBarTitle = 'Opacity';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/painting_effects/opacity_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _OpacityWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
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
              '"Opacity" widget has named parameter opacity, which specifies the opacity of the widget.',
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
