import 'package:flutter/material.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/content_group_wrapper.dart';
import '../../../../components/text_block.dart';

class AsynchronousView extends StatelessWidget {
  final String _appBarTitle = 'Asynchronous support';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'Asynchrony support',
              content: [
                TextBlock(
                  'Dart libraries are full of functions that return Future or Stream objects. These functions are asynchronous: they return after setting up a possibly time-consuming operation (such as I/O), without waiting for that operation to complete. The async and await keywords support asynchronous programming, letting you write asynchronous code that looks similar to synchronous code.',
                ),
                ContentGroupWrapper(
                  title: 'Handling Futures',
                  content: [
                    TextBlock(
                      'Use async and await.',
                    ),
                    TextBlock(
                      'Use the Future API, as described in the library tour.',
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
