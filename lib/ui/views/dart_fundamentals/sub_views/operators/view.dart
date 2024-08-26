import 'package:flutter/material.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class OperatorsView extends StatelessWidget {
  final String _appBarTitle = 'Operators';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'Operators',
              content: [
                TextBlock(
                  'Dart has operators similar to other programming languages like "&&", "]]", etc.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
