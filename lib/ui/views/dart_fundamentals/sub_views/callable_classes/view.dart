import 'package:flutter/material.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class CallableClassesView extends StatelessWidget {
  final String _appBarTitle = 'Callable classes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'Callable classes',
              content: [
                TextBlock(
                    'To allow an instance of your Dart class to be called like a function, implement the call() method.'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
