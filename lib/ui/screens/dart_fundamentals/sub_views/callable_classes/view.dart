import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class CallableClassesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Callable classes",
      mobileUi: [
        SectionWrapper(
          title: 'Callable classes',
          content: [
            TextBlock(
                'To allow an instance of your Dart class to be called like a function, implement the call() method.'),
          ],
        ),
      ],
    );
  }
}
