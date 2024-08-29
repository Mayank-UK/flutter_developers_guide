import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/components/section_wrapper.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';

class DependencyManagementView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Dependency management",
      mobileUi: [
        SectionWrapper(
          title: 'pubspec.yaml',
          content: [
            TextBlock(
              'All the dependencies are included in the pubspec.yaml file.',
            ),
          ],
        ),
      ],
    );
  }
}
