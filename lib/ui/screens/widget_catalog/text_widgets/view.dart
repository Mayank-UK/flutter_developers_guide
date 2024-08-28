import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../navigation/routes.dart';
import '../../../components/links.dart';

class TextWidgetsView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
      title: 'DefaultTextStyle',
      description:
          'The text style to apply to descendant Text widgets without explicit style.',
      route: RoutePaths.defaultTextStyle,
    ),
    LinkItem(
      title: 'RichText',
      description:
          'The RichText widget displays text that uses multiple different styles. The text to display is described using a tree of TextSpan objects, each of which has an associated style that is used for that subtree. The text might break across multiple lines or might all be displayed on the same line depending on the layout constraints.',
      route: RoutePaths.richText,
    ),
    LinkItem(
      title: 'Text',
      description: 'A run of text with a single style.',
      route: RoutePaths.text,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Text widgets",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
