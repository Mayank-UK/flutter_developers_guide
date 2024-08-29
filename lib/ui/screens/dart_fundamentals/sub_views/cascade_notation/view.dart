import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class CascadeNotationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Cascade notation",
      mobileUi: [
        SectionWrapper(
          title: 'Cascade notation',
          content: [
            TextBlock(
              'Use ".." double dot notation on an object to access it\'s methods in chain.',
            ),
          ],
        ),
      ],
    );
  }
}
