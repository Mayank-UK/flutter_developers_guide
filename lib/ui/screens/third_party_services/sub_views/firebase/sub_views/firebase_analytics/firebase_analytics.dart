import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/code_preview_tabs.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

class FirebaseAnalyticsView extends StatelessWidget {
  final String _codeTabMarkdownLocation = 'assets/markdowns/third_party_services/firebase.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Firebase Database',
      mobileUi: [
        CodePreviewTabs(
          previewTab: const _FirebaseAnalyticsImplementation(),
          codeTabMarkdownLocation: _codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _FirebaseAnalyticsImplementation extends StatelessWidget {
  const _FirebaseAnalyticsImplementation();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      child: Text('Firebase Analytics'),
    );
  }
}
