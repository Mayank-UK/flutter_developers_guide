import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class OperatorsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Operators",
      mobileUi: [
        SectionWrapper(
          title: 'Operators',
          content: [
            TextBlock(
              'Dart has operators similar to other programming languages like "&&", "]]", etc.',
            ),
          ],
        ),
      ],
    );
  }
}
