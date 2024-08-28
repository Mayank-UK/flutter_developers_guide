import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/links.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../navigation/routes.dart';

class ThirdPartyServicesView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
      title: 'Firebase',
      description: 'Using firebase services',
      route: RoutePaths.firebase,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Firebase",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
