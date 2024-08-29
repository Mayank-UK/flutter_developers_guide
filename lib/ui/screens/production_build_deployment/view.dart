import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../components/links.dart';
import '../../navigation/routes.dart';

class ProductionBuildDeploymentView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'Production build',
      description:
          'Generating a lean performance optimized build for deployment.',
      route: RoutePaths.productionBuild,
    ),
    Link(
      title: 'Android deployment',
      description: 'Putting the application on the android market.',
      route: RoutePaths.androidDeployment,
    ),
    Link(
      title: 'Appstore deployment',
      description: 'Putting the application on the ios market.',
      route: RoutePaths.iosDeployment,
    ),
    Link(
      title: 'Web deployment',
      description: 'Putting the application on web servers.',
      route: RoutePaths.webDeployment,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Production build and deployment",
      mobileUi: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
