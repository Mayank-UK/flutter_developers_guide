import 'package:flutter/material.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class TypedefsView extends StatelessWidget {
  final String _appBarTitle = 'Typedefs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'Typedefs',
              content: [
                TextBlock(
                  'In Dart, functions are objects, just like strings and numbers are objects. A typedef, or function-type alias, gives a function type a name that you can use when declaring fields and return types. A typedef retains type information when a function type is assigned to a variable.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
