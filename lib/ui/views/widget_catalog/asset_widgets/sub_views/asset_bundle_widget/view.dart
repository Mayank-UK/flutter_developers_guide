import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AssetBundleWidgetView extends StatelessWidget {
  final String _appBarTitle = 'AssetBundle';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/assets_icons_images/asset_bundle_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _AssetBundleWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
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
            TextBlock('Not used directly most of the time.'),
          ],
        ),
      ],
    );
  }
}
