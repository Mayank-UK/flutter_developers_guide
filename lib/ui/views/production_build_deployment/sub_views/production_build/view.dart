import 'package:flutter/material.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class ProductionBuildView extends StatelessWidget {
  final String _appBarTitle = 'Production build';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'Production build',
              content: [
                TextBlock('content will be available soon'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
