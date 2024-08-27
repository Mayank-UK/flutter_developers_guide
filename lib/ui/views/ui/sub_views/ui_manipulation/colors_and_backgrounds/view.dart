import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/links.dart';
import '../../../../../../core/router/routes.dart';

class ColorsBackgroundsView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
      title: 'Text Color',
      description: 'Text color',
      route: RoutePaths.colors,
    ),
    LinkItem(
      title: 'Background',
      description: 'Background color',
      route: RoutePaths.backgrounds,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Colors and backgrounds",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
