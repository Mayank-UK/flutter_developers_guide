import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AssetBundleWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/assets_icons_images/asset_bundle_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'AssetBundle',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _AssetBundleWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _AssetBundleWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'AssetBundle is the container that ships your app\'s bundled resources — images, fonts, JSON, raw strings. You rarely instantiate one; the framework provides the root bundle (rootBundle) and a widget-tree bundle (DefaultAssetBundle.of(context)) that Image, Icon, and other widgets resolve through automatically.',
            ),
            TextBlock(
              'Reach for it explicitly when you need to load non-image data yourself: rootBundle.loadString(...) to read a JSON or text asset at runtime. DefaultAssetBundle.of(context) is also the seam that lets you swap a custom bundle in tests, which is invaluable for hermetic widget tests that shouldn\'t touch the real asset set.',
            ),
          ],
        ),
      ],
    );
  }
}
