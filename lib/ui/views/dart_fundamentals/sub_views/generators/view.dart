import 'package:flutter/material.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/content_group_wrapper.dart';
import '../../../../components/text_block.dart';

class GeneratorsView extends StatelessWidget {
  final String _appBarTitle = 'Generators';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'Generators',
              content: [
                TextBlock(
                  'When you need to lazily produce a sequence of values, consider using a generator function.',
                ),
                ContentGroupWrapper(
                  title:
                      'Dart has built-in support for two kinds of generator functions:',
                  content: [
                    TextBlock(
                        'Synchronous generator: Returns an Iterable object.'),
                    TextBlock(
                        'Asynchronous generator: Returns a Stream object.'),
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
