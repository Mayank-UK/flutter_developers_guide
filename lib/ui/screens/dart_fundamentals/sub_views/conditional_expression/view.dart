import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class ConditionalExpressionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Conditional expression",
      children: [
        SectionWrapper(
          title: 'Conditional expression',
          content: [
            TextBlock('Use single line expression to evaluate a value.'),
          ],
        ),
      ],
    );
  }
}
