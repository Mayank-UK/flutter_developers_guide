import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class CommentsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Comments",
      mobileUi: [
        SectionWrapper(
          title: 'Comments',
          content: [
            TextBlock(
              'Dart supports single-line comments, multi-line comments, and documentation comments.',
            ),
          ],
        ),
      ],
    );
  }
}
