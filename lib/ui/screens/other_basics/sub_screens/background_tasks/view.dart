import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/section_wrapper.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

class BackgroundTaskView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Background tasks',
      markdownPath: 'assets/markdowns/other_basics/background_task_markdown.md',
      preview: _BackgroundTaskImplementation(),
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
