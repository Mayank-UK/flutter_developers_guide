import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';

import '../../components/main_appbar.dart';
import '../../components/section_wrapper.dart';
import '../../components/content_group_wrapper.dart';
import '../../components/markdown_preview.dart';

class ArchitectureView extends StatelessWidget {
  final String _appBarTitle = 'Architecture';
  final String _markdownLocation =
      'assets/markdowns/architecture/project_directory_structure_markdown.md';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'MVVM architecture pattern',
              content: [
                TextBlock(
                  'Development using Model View ViewModel (MVVM) architecture pattern helps in easy and efficient development of codebase. It makes applications maintainable in long term and provides easy scalability in future.',
                ),
                ContentGroupWrapper(
                  title: 'MVVM layers',
                  content: [
                    TextBlock(
                      'Model layer represents the data application is dealing with.',
                    ),
                    TextBlock(
                      'View layer represents the UI and all the visible part of an application. Users interact with the view layer of an application.',
                    ),
                    TextBlock(
                      'ViewModel layer acts as a middleman between View layer and Model layer to keep things separate and maintainable.',
                    ),
                  ],
                ),
              ],
            ),
            SectionWrapper(
              title: 'Project directory structure',
              content: [
                MarkdownPreview(markdownLocation: this._markdownLocation)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
