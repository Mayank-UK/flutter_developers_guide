import 'package:flutter/material.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class CommentsView extends StatelessWidget {
  final String _appBarTitle = 'Comments';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'Comments',
              content: [
                TextBlock(
                  'Dart supports single-line comments, multi-line comments, and documentation comments.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
