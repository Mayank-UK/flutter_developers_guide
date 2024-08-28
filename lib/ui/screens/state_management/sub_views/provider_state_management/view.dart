import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';

import '../../../../components/code_preview_tabs.dart';
import '../../../../components/section_wrapper.dart';

class ProviderStateManagementView extends StatelessWidget {
  final String _appBarTitle = 'Provider state management';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/state_management/provider_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _ProviderStateManagementImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ProviderStateManagementImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'General information',
          content: [
            TextBlock(
              'Provider is package for state management that is officially recommended by the flutter team.',
            ),
            TextBlock(
              'It is a wrapper around InheritedWidget to make them easier to use and more reusable.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'More details will be updated soon.',
          content: [
            TextBlock(
              '_',
            ),
          ],
        ),
      ],
    );
  }
}
