import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ImageWidgetView extends StatelessWidget {
  final String _appBarTitle = 'ImageWidget';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/assets_icons_images/image_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      mobileUi: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _ImageWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ImageWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
                '"Image" widget has named parameters like height, width, image, etc, which specify the image.'),
            Container(
              child: Image(
                height: 64,
                width: 64,
                image: AssetImage('assets/images/demo.jpeg'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
