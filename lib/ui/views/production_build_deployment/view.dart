import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../components/links.dart';
import './../../../core/router/routes.dart';

class ProductionBuildDeploymentView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
      title: 'Production build',
      description:
          'Generating a lean performance optimized build for deployment.',
      route: RoutePaths.productionBuild,
    ),
    LinkItem(
      title: 'Android deployment',
      description: 'Putting the application on the android market.',
      route: RoutePaths.androidDeployment,
    ),
    LinkItem(
      title: 'Appstore deployment',
      description: 'Putting the application on the ios market.',
      route: RoutePaths.iosDeployment,
    ),
    LinkItem(
      title: 'Web deployment',
      description: 'Putting the application on web servers.',
      route: RoutePaths.webDeployment,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Production build and deployment",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
