import 'package:flutter/material.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class InstallationView extends StatelessWidget {
  final String _appBarTitle = 'Installation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'Installation',
              content: [
                TextBlock(
                  'Dart gets installed automatically with flutter installation.',
                ),
                TextBlock(
                  'You can also write dart code using online dart compilers like the one made available by flutter team.',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
