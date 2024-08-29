import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class WebDeploymentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Web deployment",
      mobileUi: [
        SectionWrapper(
          title: 'Web deployment',
          content: [
            TextBlock('content will be available soon'),
          ],
        ),
      ],
    );
  }
}
