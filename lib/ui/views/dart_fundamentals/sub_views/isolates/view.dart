import 'package:flutter/material.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class IsolatesView extends StatelessWidget {
  final String _appBarTitle = 'Isolates';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'Isolates',
              content: [
                TextBlock(
                  'Most computers, even on mobile platforms, have multi-core CPUs. To take advantage of all those cores, developers traditionally use shared-memory threads running concurrently. However, shared-state concurrency is error prone and can lead to complicated code.',
                ),
                TextBlock(
                  'Instead of threads, all Dart code runs inside of isolates. Each isolate has its own memory heap, ensuring that no isolate’s state is accessible from any other isolate.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
