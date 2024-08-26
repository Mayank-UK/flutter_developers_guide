import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class FractionalTranslationWidgetView extends StatelessWidget {
  final String _appBarTitle = 'FractionalTranslation';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/painting_effects/fractional_translation_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _FractionalTranslationWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _FractionalTranslationWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"FractionalTranslation" widget has named parameter translation, which specifies the translation of it\'s child widget.',
            ),
            Container(
              color: Colors.amber,
              child: FractionalTranslation(
                translation: Offset(0.5, 0),
                child: Text(
                  "Hello world",
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
