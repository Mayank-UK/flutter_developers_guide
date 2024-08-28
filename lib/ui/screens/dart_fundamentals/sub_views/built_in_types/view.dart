import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../components/section_wrapper.dart';
import '../../../../components/content_group_wrapper.dart';
import '../../../../components/text_block.dart';

class BuiltInTypesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Build in types",
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
    );
  }
}
