import 'package:flutter/material.dart';

import './../../core/router/routes.dart';
import '../components/main_drawer_component.dart';
import '../components/custom_gridview_component.dart';

class HomeView extends StatelessWidget {
  final List<GridViewItem> _gridList = [
    GridViewItem(
        title: 'Dart fundamentals', route: RoutePaths.dartFundamentals),
    GridViewItem(
        title: 'Flutter fundamentals', route: RoutePaths.flutterFundamentals),
    GridViewItem(title: 'UI manipulation', route: RoutePaths.uiManipulation),
    GridViewItem(title: 'Lifecycle', route: RoutePaths.lifecycle),
    GridViewItem(
        title: 'Navigation and routing', route: RoutePaths.navigationRouting),
    GridViewItem(title: 'State management', route: RoutePaths.stateManagement),
    GridViewItem(title: 'Rest API', route: RoutePaths.restAPI),
    GridViewItem(title: 'Architecture', route: RoutePaths.architecture),
    GridViewItem(title: 'Debugging', route: RoutePaths.debugging),
    GridViewItem(title: 'Testing', route: RoutePaths.testing),
    GridViewItem(title: 'Widget catalog', route: RoutePaths.widgetsCatalog),
    GridViewItem(
      title: 'Supporting classes and enums',
      route: RoutePaths.supportingClassesEnums,
    ),
    GridViewItem(
      title: 'Native device features',
      route: RoutePaths.nativeDeviceFeatures,
    ),
    GridViewItem(title: 'Best practices', route: RoutePaths.bestPractices),
    GridViewItem(
      title: 'Production build and deployment',
      route: RoutePaths.productionBuildDeployment,
    ),
    GridViewItem(
      title: 'Third party services',
      route: RoutePaths.thirdPartyServices,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: const Text('Are you sure you want to exit?'),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text('No'),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Yes, exit'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              );
            });

        return value == true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter developers guide'),
        ),
        drawer: MainDrawerComponent(),
        body: CustomGridViewComponent(
          gridList: _gridList,
        ),
      ),
    );
  }
}
