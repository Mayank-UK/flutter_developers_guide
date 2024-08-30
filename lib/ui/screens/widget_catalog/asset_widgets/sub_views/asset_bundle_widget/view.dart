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
            TextBlock('Not used directly most of the time.'),
          ],
        ),
      ],
    );
  }
}
