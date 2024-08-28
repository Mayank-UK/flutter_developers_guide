import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class ExceptionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Exceptions",
      children: [
        SectionWrapper(
          title: 'Exceptions',
          content: [
            TextBlock(
                'Your Dart code can throw and catch exceptions. Exceptions are errors indicating that something unexpected happened. If the exception isn’t caught, the isolate that raised the exception is suspended, and typically the isolate and its program are terminated.'),
            TextBlock(
              'Dart provides Exception and Error types, as well as numerous predefined subtypes. You can, of course, define your own exceptions. However, Dart programs can throw any non-null object—not just Exception and Error objects—as an exception.',
            ),
          ],
        ),
      ],
    );
  }
}
