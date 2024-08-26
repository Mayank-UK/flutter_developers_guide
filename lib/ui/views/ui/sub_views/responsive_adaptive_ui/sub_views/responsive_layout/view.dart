import 'package:flutter/material.dart';

import '../../../../../../components/code_preview_tabs.dart';
import '../../../../../../components/section_wrapper.dart';

class ResponsiveLayoutView extends StatelessWidget {
  final String _appBarTitle = 'Responsive layout';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/responsive_adaptive_layout/responsive_layout_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _ResponsiveLayoutImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _ResponsiveLayoutImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Responsive layout',
          content: [
            Container(
              width: double.infinity,
              child: const Text('content will be available soon'),
            )
          ],
        ),
      ],
    );
  }
}
