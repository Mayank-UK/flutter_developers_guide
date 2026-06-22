import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/navigation/routes.dart';
import 'package:flutter_developers_guide/ui/components/links.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

class HomeView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: "Flutter fundamentals",
      route: RoutePaths.flutterFundamentals,
    ),
    Link(
      title: "Dart fundamentals",
      route: RoutePaths.dartFundamentals,
    ),
    Link(
      title: "UI",
      route: RoutePaths.ui,
    ),
    Link(
      title: "Widget catalog",
      route: RoutePaths.widgetsCatalog,
    ),
    Link(
      title: "Lifecycle",
      route: RoutePaths.lifecycle,
    ),
    Link(
      title: "Navigation and routing",
      route: RoutePaths.navigationRouting,
    ),
    Link(
      title: "State management",
      route: RoutePaths.stateManagement,
    ),
    Link(
      title: "API handling",
      route: RoutePaths.apiHandling,
    ),
    Link(
      title: "Database handling",
      route: RoutePaths.databaseHandling,
    ),
    Link(
      title: "Exception handling",
      route: RoutePaths.exceptionHandling,
    ),
    Link(
      title: "Architecture",
      route: RoutePaths.architecture,
    ),
    Link(
      title: "Debugging",
      route: RoutePaths.debugging,
    ),
    Link(
      title: "Testing",
      route: RoutePaths.testing,
    ),
    Link(
      title: "Supporting classes and enums",
      route: RoutePaths.supportingClassesEnums,
    ),
    Link(
      title: "Native device features",
      route: RoutePaths.nativeDeviceFeatures,
    ),
    Link(
      title: "Notifications",
      route: RoutePaths.notification,
    ),
    Link(
      title: "Widgets",
      route: RoutePaths.widget,
    ),
    Link(
      title: "Other basics",
      route: RoutePaths.otherBasics,
    ),
    Link(
      title: "Dependency management",
      route: RoutePaths.dependencyManagement,
    ),
    Link(
      title: "Production build and deployment",
      route: RoutePaths.productionBuildDeployment,
    ),
    Link(
      title: "Third party services",
      route: RoutePaths.thirdPartyServices,
    ),
    Link(
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
        mobileUi: [
          Links(
            itemList: _itemList,
          ),
        ],
      ),
    );
  }
}
