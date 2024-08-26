import 'package:flutter/material.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/content_group_wrapper.dart';
import '../../../../components/text_block.dart';

class UsingFlutterView extends StatelessWidget {
  final String _appBarTitle = 'Using flutter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
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
                ContentGroupWrapper(
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
                ContentGroupWrapper(
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
        ),
      ),
    );
  }
}
