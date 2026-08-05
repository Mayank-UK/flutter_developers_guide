import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class AsynchronousView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Asynchronous support",
      mobileUi: [
        SectionWrapper(
          title: 'Basics',
          content: [
            TextBlock(
              'Dart libraries are full of functions that return Future or Stream objects. These functions are asynchronous: they return after setting up a possibly time-consuming operation (such as I/O), without waiting for that operation to complete. The async and await keywords support asynchronous programming, letting you write asynchronous code that looks similar to synchronous code.',
            ),
            SectionWrapper(tinted: false, runSpacing: 4, titleStyle: Theme.of(context).textTheme.bodyLarge,
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
    );
  }
}
