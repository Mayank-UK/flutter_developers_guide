import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';
import 'package:flutter_developers_guide/ui/navigation/routes.dart';
import 'package:go_router/go_router.dart';

import '../../../../components/section_wrapper.dart';

class ProviderStateManagementView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Provider state management',
      markdownPath: 'assets/markdowns/state_management/provider_markdown.md',
      preview: _ProviderStateManagementImplementation(),
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
          title: 'Todo examples',
          content: [
            ElevatedButton(
              onPressed: () => {
                context.push(RoutePaths.state_management_todos_example),
              },
              child: Text("Todo app"),
            ),
          ],
        ),
      ],
    );
  }
}
