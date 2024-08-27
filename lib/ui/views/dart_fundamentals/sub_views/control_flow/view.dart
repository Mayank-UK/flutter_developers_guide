import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class ControlFlowStatementView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Control flow statements",
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
    );
  }
}
