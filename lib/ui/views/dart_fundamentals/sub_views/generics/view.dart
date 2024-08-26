import 'package:flutter/material.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class GenericsView extends StatelessWidget {
  final String _appBarTitle = 'Generics';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'Generics',
              content: [
                TextBlock(
                  'Generics are often required for type safety, but they have more benefits than just allowing your code to run.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
