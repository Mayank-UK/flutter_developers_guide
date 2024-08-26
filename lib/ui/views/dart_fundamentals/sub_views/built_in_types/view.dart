import 'package:flutter/material.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/content_group_wrapper.dart';
import '../../../../components/text_block.dart';

class BuiltInTypesView extends StatelessWidget {
  final String _appBarTitle = 'Build in types';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'Build in types',
              content: [
                TextBlock(
                  'The data types build into dart language',
                ),
                ContentGroupWrapper(
                  title: 'Important build in data types',
                  content: [
                    TextBlock(
                      'int\ndouble\nString\nbool\nList\nSet\nMap\nRunes\nSymbol\nNull',
                    ),
                  ],
                ),
                ContentGroupWrapper(
                  title: 'Other types',
                  content: [
                    TextBlock(
                      'Object\nFuture\nStream\nIterable\nNever\ndynamic\nvoid',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
