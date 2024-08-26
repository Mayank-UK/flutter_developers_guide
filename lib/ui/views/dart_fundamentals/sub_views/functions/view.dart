import 'package:flutter/material.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class FunctionsView extends StatelessWidget {
  final String _appBarTitle = 'Functions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'Functions',
              content: [
                TextBlock(
                  'A block of code that can be called to execute the code it contains in it\'s body.',
                ),
                TextBlock(
                  'Dart functions are similar to functions in other programming languages.',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
