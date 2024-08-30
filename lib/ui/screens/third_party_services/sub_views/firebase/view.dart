import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../components/code_preview_tabs.dart';
import '../../../../components/section_wrapper.dart';

class FirebaseView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/third_party_services/firebase.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Firebase integration',
      mobileUi: [
        CodePreviewTabs(
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
          title: 'Basics',
          content: [
            Container(
              width: double.infinity,
              child: const Text('content will be available soon.'),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Firebase',
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
