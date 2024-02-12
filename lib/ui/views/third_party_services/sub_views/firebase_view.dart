import 'package:flutter/material.dart';

import '../../../components/code_preview_component.dart';
import '../../../components/section_wrapper_component_component.dart';

class FirebaseView extends StatelessWidget {
  final String _appBarTitle = 'Firebase integration';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/third_party_services/firebase.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabsComponent(
      appBarTitle: this._appBarTitle,
      previewTab: _IntegrationTestingImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _IntegrationTestingImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapperComponent(
          title: 'Basics',
          content: [
            Container(
              width: double.infinity,
              child: const Text('content will be available soon.'),
            ),
          ],
        ),
        SectionWrapperComponent(
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
