import 'package:flutter/material.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class LibrariesVisibilityView extends StatelessWidget {
  final String _appBarTitle = 'Libraries and visibility';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'Libraries and visibility',
              content: [
                TextBlock(
                  'The import and library directives can help you create a modular and shareable code base. Libraries not only provide APIs, but are a unit of privacy: identifiers that start with an underscore (_) are visible only inside the library. Every Dart app is a library, even if it doesn’t use a library directive.',
                ),
                TextBlock(
                  'Libraries can be distributed using packages.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
