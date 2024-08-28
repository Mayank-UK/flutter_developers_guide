import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/models/list_item.dart';
import 'package:flutter_developers_guide/ui/navigation/routes.dart';
import 'package:flutter_developers_guide/ui/components/links.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

class HomeView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
      title: "Flutter fundamentals",
      route: RoutePaths.flutterFundamentals,
    ),
    LinkItem(
      title: "Dart fundamentals",
      route: RoutePaths.dartFundamentals,
    ),
    LinkItem(
      title: "UI",
      route: RoutePaths.ui,
    ),
    LinkItem(
      title: "Widget catalog",
      route: RoutePaths.widgetsCatalog,
    ),
    LinkItem(
      title: "Lifecycle",
      route: RoutePaths.lifecycle,
    ),
    LinkItem(
      title: "Navigation and routing",
      route: RoutePaths.navigationRouting,
    ),
    LinkItem(
      title: "State management",
      route: RoutePaths.stateManagement,
    ),
    LinkItem(
      title: "API handling",
      route: RoutePaths.apiHandling,
    ),
    LinkItem(
      title: "Architecture",
      route: RoutePaths.architecture,
    ),
    LinkItem(
      title: "Debugging",
      route: RoutePaths.debugging,
    ),
    LinkItem(
      title: "Testing",
      route: RoutePaths.testing,
    ),
    LinkItem(
      title: "Supporting classes and enums",
      route: RoutePaths.supportingClassesEnums,
    ),
    LinkItem(
      title: "Native device features",
      route: RoutePaths.nativeDeviceFeatures,
    ),
    LinkItem(
      title: "Dependency management",
      route: RoutePaths.dependencyManagement,
    ),
    LinkItem(
      title: "Production build and deployment",
      route: RoutePaths.productionBuildDeployment,
    ),
    LinkItem(
      title: "Third party services",
      route: RoutePaths.thirdPartyServices,
    ),
    LinkItem(
      title: "Best practices",
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
      child: PageScaffold(
        title: "Flutter developer's guide",
        children: [
          Links(
            itemList: _itemList,
          ),
        ],
      ),
    );
  }
}
