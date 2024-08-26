import 'package:flutter/material.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class Flutter2View extends StatelessWidget {
  final String _appBarTitle = 'Flutter 2.0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'Flutter 2.0',
              content: [
                TextBlock('content will be available soon.'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
