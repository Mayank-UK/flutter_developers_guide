import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/links.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../navigation/routes.dart';

class LifecycleView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'Application lifecycle',
      description: 'Doing stuff at various stages of an application lifecycle.',
      route: RoutePaths.applicationLifecycle,
    ),
    Link(
      title: 'Widget lifecycle',
      description: 'Doing stuff at various stages of a widget lifecycle.',
      route: RoutePaths.widgetLifecycle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Lifecycle",
      children: [
        Links(
          itemList: this._itemList,
        ),
      ],
    );
  }
}
