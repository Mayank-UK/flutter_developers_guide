import 'package:flutter/material.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class ExceptionsView extends StatelessWidget {
  final String _appBarTitle = 'Exceptions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'Exceptions',
              content: [
                TextBlock(
                    'Your Dart code can throw and catch exceptions. Exceptions are errors indicating that something unexpected happened. If the exception isn’t caught, the isolate that raised the exception is suspended, and typically the isolate and its program are terminated.'),
                TextBlock(
                  'Dart provides Exception and Error types, as well as numerous predefined subtypes. You can, of course, define your own exceptions. However, Dart programs can throw any non-null object—not just Exception and Error objects—as an exception.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
