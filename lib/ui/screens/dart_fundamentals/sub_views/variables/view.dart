import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class VariablesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Variables",
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
    );
  }
}
