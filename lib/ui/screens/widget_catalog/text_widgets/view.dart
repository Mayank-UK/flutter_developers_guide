import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../navigation/routes.dart';
import '../../../components/links.dart';

class TextWidgetsView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'DefaultTextStyle',
      description:
          'The text style to apply to descendant Text widgets without explicit style.',
      route: RoutePaths.defaultTextStyle,
    ),
    Link(
      title: 'RichText',
      description:
          'The RichText widget displays text that uses multiple different styles. The text to display is described using a tree of TextSpan objects, each of which has an associated style that is used for that subtree. The text might break across multiple lines or might all be displayed on the same line depending on the layout constraints.',
      route: RoutePaths.richText,
    ),
    Link(
      title: 'Text',
      description: 'A run of text with a single style.',
      route: RoutePaths.text,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Text widgets",
      mobileUi: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
