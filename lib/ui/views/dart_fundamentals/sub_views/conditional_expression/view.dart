import 'package:flutter/material.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class ConditionalExpressionView extends StatelessWidget {
  final String _appBarTitle = 'Conditional expression';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'Conditional expression',
              content: [
                TextBlock('Use single line expression to evaluate a value.'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
