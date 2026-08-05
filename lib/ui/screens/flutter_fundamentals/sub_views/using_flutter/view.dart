import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class UsingFlutterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Using flutter",
      mobileUi: [
        SectionWrapper(
          title: 'Creating a new flutter project',
          content: [
            TextBlock(
              'Go to the appropriate directory and create a project using command "flutter create project_name" or use IDE (flutter and dart plugin installed).',
            ),
          ],
        ),
        SectionWrapper(
          title: 'Start development environment',
          content: [
            SectionWrapper(tinted: false, runSpacing: 4, titleStyle: Theme.of(context).textTheme.bodyLarge,
              title: 'Through IDE (preferred)',
              content: <Widget>[
                TextBlock(
                  '1. Run the application using without debugging mode from the IDE menu.',
                ),
                TextBlock(
                  '1. Run the application using without debugging mode from the IDE menu.',
                ),
              ],
            ),
            SectionWrapper(tinted: false, runSpacing: 4, titleStyle: Theme.of(context).textTheme.bodyLarge,
              title: 'Through command line',
              content: <Widget>[
                TextBlock(
                  '1. Run the emulator or connect a physical device through USB debugging.',
                ),
                TextBlock(
                  '2. Go to the project directory and run command "flutter run"',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
