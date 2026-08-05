import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../components/section_wrapper.dart';

class ApplicationLifecycleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Application lifecycle',
      markdownPath: 'assets/markdowns/lifecycle/application_lifecycle_markdown.md',
      preview: _ApplicationLifecycleImplementation(),
    );
  }
}

class _ApplicationLifecycleImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'inactive',
          content: [
            TextBlock(
              'The application is in an inactive state and is not receiving user input (iOS only)',
            ),
          ],
        ),
        SectionWrapper(
          title: 'paused',
          content: [
            TextBlock(
              'The application is not currently visible to the user, not responding to user input, and running in the background.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'resumed',
          content: [
            TextBlock(
              'The application is visible and responding to user input.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'suspending',
          content: [
            TextBlock(
              'The application will be suspended momentarily (android only).',
            ),
          ],
        ),
      ],
    );
  }
}
