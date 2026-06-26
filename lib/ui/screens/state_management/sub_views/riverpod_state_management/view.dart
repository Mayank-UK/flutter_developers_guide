import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';
import 'package:flutter_developers_guide/ui/navigation/routes.dart';
import 'package:go_router/go_router.dart';

import '../../../../components/code_preview_tabs.dart';
import '../../../../components/section_wrapper.dart';

class RiverpodStateManagementView extends StatelessWidget {
  final String _codeTabMarkdownLocation = 'assets/markdowns/state_management/riverpod_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'RiverPod state management',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _RiverpodStateManagementImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _RiverpodStateManagementImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'General information',
          content: [
            TextBlock(
              'Riverpod is a modern state management solution created by the author of Provider. It is designed to be type-safe, compile-time safe, and independent of the widget tree.',
            ),
            TextBlock(
              'Unlike Provider, Riverpod does not rely on BuildContext to access state. This makes state easier to manage, test, and reuse across your application while reducing common runtime errors.',
            ),
            TextBlock(
              'Riverpod supports synchronous and asynchronous state, dependency injection, automatic resource disposal, provider composition, and excellent integration with Flutter DevTools.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'Todo examples',
          content: [
            ElevatedButton(
              onPressed: () {
                context.push(RoutePaths.riverpod_state_management_todos_example);
              },
              child: const Text('Todo app'),
            ),
          ],
        ),
      ],
    );
  }
}
