import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../navigation/routes.dart';
import '../../../components/links.dart';

class StylingWidgetsView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
      title: 'Padding',
      description: 'A widget that insets its child by the given padding.',
      route: RoutePaths.padding,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Styling widgets",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
