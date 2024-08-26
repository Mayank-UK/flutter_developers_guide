import 'package:flutter/material.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class WebDeploymentView extends StatelessWidget {
  final String _appBarTitle = 'Web deployment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'Web deployment',
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
