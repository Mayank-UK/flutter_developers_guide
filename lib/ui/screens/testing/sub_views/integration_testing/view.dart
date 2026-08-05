import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../components/section_wrapper.dart';

class IntegrationTestingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Integration testing',
      markdownPath: 'assets/markdowns/test.md',
      preview: _IntegrationTestingImplementation(),
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
