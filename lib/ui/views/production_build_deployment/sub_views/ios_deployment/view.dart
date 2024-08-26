import 'package:flutter/material.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class IosDeploymentView extends StatelessWidget {
  final String _appBarTitle = 'IOS deployment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'IOS deployment',
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
