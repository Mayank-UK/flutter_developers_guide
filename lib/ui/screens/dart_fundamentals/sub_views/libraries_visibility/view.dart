import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class LibrariesVisibilityView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Libraries and visibility",
      children: [
        SectionWrapper(
          title: 'Libraries and visibility',
          content: [
            TextBlock(
              'The import and library directives can help you create a modular and shareable code base. Libraries not only provide APIs, but are a unit of privacy: identifiers that start with an underscore (_) are visible only inside the library. Every Dart app is a library, even if it doesn’t use a library directive.',
            ),
            TextBlock(
              'Libraries can be distributed using packages.',
            ),
          ],
        ),
      ],
    );
  }
}
