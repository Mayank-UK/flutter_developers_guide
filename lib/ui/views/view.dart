import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';
import 'package:flutter_developers_guide/core/router/routes.dart';
import 'package:flutter_developers_guide/ui/components/list.dart';
import 'package:flutter_developers_guide/ui/components/main_drawer.dart';

class HomeView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
      title: "Flutter fundamentals",
      description: "",
      route: RoutePaths.flutterFundamentals,
    ),
    ListViewItem(
      title: "Dart fundamentals",
      description: "",
      route: RoutePaths.dartFundamentals,
    ),
    ListViewItem(
      title: "UI",
      description: "",
      route: RoutePaths.ui,
    ),
    ListViewItem(
      title: "Widget catalog",
      description: "",
      route: RoutePaths.widgetsCatalog,
    ),
    ListViewItem(
      title: "Lifecycle",
      description: "",
      route: RoutePaths.lifecycle,
    ),
    ListViewItem(
      title: "Navigation and routing",
      description: "",
      route: RoutePaths.navigationRouting,
    ),
    ListViewItem(
      title: "State management",
      description: "",
      route: RoutePaths.stateManagement,
    ),
    ListViewItem(
      title: "API handling",
      description: "",
      route: RoutePaths.apiHandling,
    ),
    ListViewItem(
      title: "Architecture",
      description: "",
      route: RoutePaths.architecture,
    ),
    ListViewItem(
      title: "Debugging",
      description: "",
      route: RoutePaths.debugging,
    ),
    ListViewItem(
      title: "Testing",
      description: "",
      route: RoutePaths.testing,
    ),
    ListViewItem(
      title: "Supporting classes and enums",
      description: "",
      route: RoutePaths.supportingClassesEnums,
    ),
    ListViewItem(
      title: "Native device features",
      description: "",
      route: RoutePaths.nativeDeviceFeatures,
    ),
    ListViewItem(
      title: "Dependency management",
      description: "",
      route: RoutePaths.dependencyManagement,
    ),
    ListViewItem(
      title: "Production build and deployment",
      description: "",
      route: RoutePaths.productionBuildDeployment,
    ),
    ListViewItem(
      title: "Third party services",
      description: "",
      route: RoutePaths.thirdPartyServices,
    ),
    ListViewItem(
      title: "Best practices",
      description: "",
      route: RoutePaths.bestPractices,
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
        drawer: MainDrawer(),
        body: Links(
          itemList: _itemList,
        ),
      ),
    );
  }
}
