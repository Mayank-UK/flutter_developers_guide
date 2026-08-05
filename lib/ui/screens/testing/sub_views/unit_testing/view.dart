import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../components/section_wrapper.dart';

class UnitTestingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Unit testing',
      markdownPath: 'assets/markdowns/test.md',
      preview: _UnitTestingImplementation(),
    );
  }
}

class _UnitTestingImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Unit testing',
          content: [
            SizedBox(
              width: double.infinity,
              child: const Text(
                  'A unit test tests the smallest piece of your code in isolation.'),
            ),
            SizedBox(
              width: double.infinity,
              child: const Text(
                  'Think of your Flutter app as layers:\n Widget, Bloc/Cubit, UseCase, Repository, API/Database'),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Mocking',
          content: [
            SizedBox(
              width: double.infinity,
              child: const Text(
                  'Mocking means creating a fake version of a dependency so you can control its behavior during testing.'),
            ),
            SizedBox(
              width: double.infinity,
              child: const Text(
                  'Each file is completely independent. No test file knows about another. Each one creates its own fake world from scratch in setUp().'),
            ),
          ],
        ),
        SectionWrapper(
          title: 'What to test?',
          content: [
            SizedBox(
              width: double.infinity,
              child: const Text(
                  'Test logic in different files like RemoteDataSource, RepositoryImplementation, UseCases, Blocs, etc'),
            ),
            SizedBox(
              width: double.infinity,
              child: const Text(
                  'Although widgets can be tested, but the testing becomes too fragile, it\'s better to test the surrounding logic.'),
            ),
          ],
        ),
      ],
    );
  }
}
