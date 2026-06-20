import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class TypedefsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Typedefs",
      mobileUi: [
        SectionWrapper(
          title: 'Typedefs',
          content: [
            TextBlock(
              'A typedef in Dart is a type alias that gives an existing type a new, meaningful name. It does not create a new type; it simply makes the code easier to read and reuse.',
            ),
          ],
        ),
      ],
    );
  }
}
