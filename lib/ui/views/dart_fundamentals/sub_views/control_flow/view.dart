import 'package:flutter/material.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class ControlFlowStatementView extends StatelessWidget {
  final String _appBarTitle = 'Control flow statements';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'if-else',
              content: [
                TextBlock(
                  'For conditional logic.',
                ),
                TextBlock(
                  'Similar to other programming languages.',
                ),
              ],
            ),
            SectionWrapper(
              title: 'for loops',
              content: [
                TextBlock('Similar to other programming languages.'),
              ],
            ),
            SectionWrapper(
              title: 'while and do-while loops',
              content: [
                TextBlock('Similar to other programming languages.'),
              ],
            ),
            SectionWrapper(
              title: 'break and continue',
              content: [
                TextBlock('Similar to other programming languages.'),
              ],
            ),
            SectionWrapper(
              title: 'switch and case',
              content: [
                TextBlock('Similar to other programming languages.'),
              ],
            ),
            SectionWrapper(
              title: 'assert',
              content: [
                TextBlock('Similar to other programming languages.'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
