import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/links.dart';
import '../../../../../navigation/routes.dart';

class LayoutView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'Basic layout widgets',
      description: 'Basic layout widgets like container, row, column etc',
      route: RoutePaths.basicLayout,
    ),
    Link(
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
