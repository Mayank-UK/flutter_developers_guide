import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/design_system/design_system.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/content_group_wrapper.dart';
import '../../../../components/text_block.dart';
import '../../../../components/markdown_preview.dart';

class ImportantConceptsFlutterView extends StatelessWidget {
  final String _appBarTitle = 'Important concepts';
  final String _directoryStructureMarkdown =
      'assets/markdowns/flutter_fundamentals/important_concepts_flutter_markdown.md';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'Important concepts',
              content: [
                TextBlock(
                  'Flutter is an open source framework developed by Google to create cross platform applications like android, ios, desktop, and web with one codebase using a single programming language called "dart".',
                ),
                TextBlock(
                  'Flutter framework uses Dart programming language which is also developed by Google. Dart is specially designed to develop frontend UI\'s.',
                ),
                ContentGroupWrapper(
                  title: 'Flutter is composed of two major components:',
                  content: <Widget>[
                    TextBlock(
                      '1. Flutter SDK (to compile, develop, debug, etc)',
                    ),
                    TextBlock(
                      '2. Widget library based on dart (to build UI)',
                    ),
                  ],
                ),
                TextBlock(
                  'UI in flutter is build using combining different "Widgets" provided by their widget library. Every UI element in flutter is a widget including margins, paddings, borders, etc',
                ),
                TextBlock(
                  'Flutter applications render at 60FPS which gives a smooth experience.',
                ),
              ],
            ),
            SectionWrapper(
              title: 'Information for web developer\'s',
              content: [
                TextBlock(
                  'Think of a widget as of an html tag, like an html tag has it\'s own specific attributes, a widget has it\'s own specific named named parameters, like an html tag can have it\'s own inline styling, similarly widgets can have their own styling, as an html tag can have javascript logic and events, similarly a widget can have it\'s own logic and events. Like html tags form a nested tree structure, similarly widget form a nested tree structure to build a UI.',
                ),
                TextBlock(
                  'In web UI is divided into separate technologies like HTML for structuring, CSS for styling, and javascript for behavior, while in flutter it\'s all present at the same place.',
                ),
              ],
            ),
            SectionWrapper(
              title: 'Flutter directory structure',
              content: [
                MarkdownPreview(
                  markdownLocation: this._directoryStructureMarkdown,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
