import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/section_wrapper.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

class DatabaseHandlingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Database handling',
      markdownPath: 'assets/markdowns/database_handling/database_handling_markdown.md',
      preview: _DatabaseHandlingImplementation(),
    );
  }
}

class _DatabaseHandlingImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Basics',
          content: [
            TextBlock(
                "Use local database to improve application performance, user experience and reduce load on server."),
            TextBlock(
                "This is also used to enable the app to run in offline mode."),
            TextBlock(
                "In flutter database handling is done using sqflite, it is very simple and don't even require entities to setup the database."),
          ],
        ),
      ],
    );
  }
}
