import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class TypedefsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Typedefs",
      children: [
        SectionWrapper(
          title: 'Typedefs',
          content: [
            TextBlock(
              'In Dart, functions are objects, just like strings and numbers are objects. A typedef, or function-type alias, gives a function type a name that you can use when declaring fields and return types. A typedef retains type information when a function type is assigned to a variable.',
            ),
          ],
        ),
      ],
    );
  }
}
