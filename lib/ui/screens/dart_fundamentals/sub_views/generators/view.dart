import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../components/section_wrapper.dart';
import '../../../../components/content_group_wrapper.dart';
import '../../../../components/text_block.dart';

class GeneratorsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Generators",
      mobileUi: [
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
                TextBlock('Synchronous generator: Returns an Iterable object.'),
                TextBlock('Asynchronous generator: Returns a Stream object.'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
