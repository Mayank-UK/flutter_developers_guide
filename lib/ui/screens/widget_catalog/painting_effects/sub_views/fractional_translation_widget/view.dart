import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class FractionalTranslationWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/painting_effects/fractional_translation_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'FractionalTranslation',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _FractionalTranslationWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
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
