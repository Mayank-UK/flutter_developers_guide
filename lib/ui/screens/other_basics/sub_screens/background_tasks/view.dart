import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/code_preview_tabs.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/components/section_wrapper.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';

class BackgroundTaskView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/other_basics/background_task_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Background tasks',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _BackgroundTaskImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _BackgroundTaskImplementation extends StatelessWidget {
  const _BackgroundTaskImplementation({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Basics',
      content: [
        TextBlock(
            "There are many ways to run backgrounds tasks in flutter. Most of the ways are achieved through plugings."),
        TextBlock("- Using 'flutter_background_service' package"),
        TextBlock("- Using 'workmanager' package"),
        TextBlock("- Using 'android_alarm_manager_plus' package"),
        TextBlock("- Using 'background_fetch' package")
      ],
    );
  }
}
