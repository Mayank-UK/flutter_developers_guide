import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/links.dart';
import '../../../../../../core/router/routes.dart';

class LayoutView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
      title: 'Basic layout widgets',
      description: 'Basic layout widgets like container, row, column etc',
      route: RoutePaths.basicLayout,
    ),
    LinkItem(
      title: 'Application and page layout',
      description:
          'Structuring a the layout for whole application and individual pages.',
      route: RoutePaths.pageLayout,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Layout",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
