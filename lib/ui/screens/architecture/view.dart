import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';

import '../../components/section_wrapper.dart';
import '../../components/markdown_preview.dart';

class ArchitectureView extends StatelessWidget {
  final String _markdownLocation1 =
      'assets/markdowns/architecture/project_directory_structure_markdown_1.md';
  final String _markdownLocation2 =
      'assets/markdowns/architecture/project_directory_structure_markdown_2.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Architecture",
      mobileUi: [
        SectionWrapper(
          title: 'MVVM architecture pattern',
          content: [
            TextBlock(
              'Development using Model View ViewModel (MVVM) architecture pattern helps in easy and efficient development of codebase. It makes applications maintainable in long term and provides easy scalability in future.',
            ),
            SectionWrapper(tinted: false, runSpacing: 4, titleStyle: Theme.of(context).textTheme.bodyLarge,
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
            MarkdownPreview(markdownLocation: this._markdownLocation1),
          ],
        ),
        SectionWrapper(
          title: 'Clean Bloc pattern',
          content: [
            TextBlock(
              'This is similar to all other clean architectures with separation between data, domain, presentation layer.',
            ),
            TextBlock(
              'One thing different is that there are no database entities used in flutter in a standard way. And if entities are used then they basically represent models in most of the cases.',
            ),
            MarkdownPreview(markdownLocation: this._markdownLocation2),
          ],
        ),
      ],
    );
  }
}
