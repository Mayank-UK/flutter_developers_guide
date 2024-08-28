import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class GenericsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Generics",
      children: [
        SectionWrapper(
          title: 'Generics',
          content: [
            TextBlock(
              'Generics are often required for type safety, but they have more benefits than just allowing your code to run.',
            ),
          ],
        ),
      ],
    );
  }
}
