import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';
import 'package:flutter_developers_guide/ui/navigation/routes.dart';
import 'package:go_router/go_router.dart';

import '../../../../components/section_wrapper.dart';

class BlocStateManagementView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Bloc state management',
      markdownPath: 'assets/markdowns/state_management/bloc_markdown.md',
      preview: _BlocStateManagementImplementation(),
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
                context.push(RoutePaths.state_management_posts_example),
              },
              child: Text("Posts app"),
            ),
          ],
        ),
      ],
    );
  }
}
