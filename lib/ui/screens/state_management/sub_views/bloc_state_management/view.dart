import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';
import 'package:flutter_developers_guide/ui/navigation/routes.dart';

import '../../../../components/code_preview_tabs.dart';
import '../../../../components/section_wrapper.dart';

class BlocStateManagementView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/state_management/bloc_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Bloc state management',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _BlocStateManagementImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _BlocStateManagementImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'General information',
          content: [
            TextBlock(
              'Bloc is the preferred state management solution for mid to large scale apps.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'Posts example',
          content: [
            ElevatedButton(
              onPressed: () => {
                Navigator.of(context)
                    .pushNamed(RoutePaths.state_management_posts_example),
              },
              child: Text("Posts app"),
            ),
          ],
        ),
      ],
    );
  }
}
