import 'package:flutter/material.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class VariablesView extends StatelessWidget {
  final String _appBarTitle = 'Variables';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'Variables',
              content: [
                TextBlock(
                  'Variables store references.',
                ),
                TextBlock(
                  'Most of the concepts are similar to other programming languages like declaration, type, initialization, etc.',
                ),
                TextBlock(
                  'Use "?" with a variable to make it nullable.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
