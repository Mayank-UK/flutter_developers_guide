import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/section_wrapper.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

class WidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Widget',
      markdownPath: 'assets/markdowns/widget/widget_markdown.md',
      preview: _WidgetImplementation(),
    );
  }
}

class _WidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Basics',
          content: [
            TextBlock("Show widgets on home screen."),
          ],
        ),
      ],
    );
  }
}
