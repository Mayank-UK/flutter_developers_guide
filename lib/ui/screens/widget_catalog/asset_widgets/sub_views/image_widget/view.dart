import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ImageWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/assets_icons_images/image_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'ImageWidget',
      mobileUi: [
        CodePreviewTabs(
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
              'Image decodes and displays a raster picture from an asset, network URL, file, or in-memory bytes. Pick the named constructor that matches your source — Image.asset, Image.network, Image.file, or Image.memory — and use `fit` (a BoxFit) to control how the picture is scaled and aligned inside its box.',
            ),
            TextBlock(
              'Always give network and file images an explicit width/height (or wrap them in a constrained parent) so the surrounding layout doesn\'t jump while bytes arrive. For cases where you already hold a decoded dart:ui.Image — typically from a codec or custom painter — drop down to RawImage to skip the ImageProvider pipeline entirely.',
            ),
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
