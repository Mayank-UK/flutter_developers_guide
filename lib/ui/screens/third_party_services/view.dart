import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/links.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../navigation/routes.dart';

class ThirdPartyServicesView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
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
