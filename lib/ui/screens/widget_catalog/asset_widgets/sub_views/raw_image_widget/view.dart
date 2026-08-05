import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class RawImageWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/assets_icons_images/raw_image_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'RawImage',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _RawImageWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _RawImageWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'RawImage displays a dart:ui.Image directly, bypassing the ImageProvider machinery that the regular Image widget uses for resolution, decoding, and caching. You reach for it only when you already hold a decoded ui.Image in hand — typically produced by a codec, a custom painter, or image-processing code.',
            ),
            TextBlock(
              'Most apps never need it: the plain Image widget handles asset/network loading, decoding on a background isolate, caching, and error fallbacks for you. Prefer it unless you have an explicit ui.Image and want to skip that pipeline, since RawImage leaves all of those concerns to the caller.',
            ),
          ],
        ),
      ],
    );
  }
}
