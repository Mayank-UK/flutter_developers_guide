import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ExcludeSemanticsWidgetView extends StatelessWidget {
  final String _appBarTitle = 'ExcludeSemantics';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/accessibility/exclude_semantics_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      mobileUi: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _ExcludeSemanticsWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ExcludeSemanticsWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
                '"ExcludeSemantics" widget, which removes the semantics from it\'s child tree.'),
            Container(
              child: ExcludeSemantics(
                excluding: true,
                child: Image(
                  height: 64,
                  width: 64,
                  image: AssetImage(
                    'assets/images/demo.jpeg',
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
