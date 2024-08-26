import 'package:flutter/material.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class CascadeNotationView extends StatelessWidget {
  final String _appBarTitle = 'Cascade notation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'Cascade notation',
              content: [
                TextBlock(
                  'Use ".." double dot notation on an object to access it\'s methods in chain.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
