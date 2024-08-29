import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class InstallationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Installation",
      mobileUi: [
        SectionWrapper(
          title: 'Installation',
          content: [
            TextBlock(
              'Dart gets installed automatically with flutter installation.',
            ),
            TextBlock(
              'You can also write dart code using online dart compilers like the one made available by flutter team.',
            )
          ],
        ),
      ],
    );
  }
}
