import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../components/code_preview_tabs.dart';
import '../../../../components/section_wrapper.dart';

class IntegrationTestingView extends StatelessWidget {
  final String _appBarTitle = 'Integration testing';
  final String _codeTabMarkdownLocation = 'assets/markdowns/test.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _IntegrationTestingImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _IntegrationTestingImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Integration testing',
          content: [
            Container(
              width: double.infinity,
              child: const Text('content will be available soon.'),
            ),
          ],
        ),
      ],
    );
  }
}
