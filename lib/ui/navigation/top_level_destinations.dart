import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/navigation/routes.dart';

/// The top-level navigation destinations shared by the home screen and the
/// app drawer — single source of truth so the two stay in lock-step.
///
/// Order mirrors the home menu. The drawer renders the title only; the home
/// cards may attach richer per-[Link] descriptions when needed.
const List<Link> topLevelDestinations = [
  Link(title: 'Flutter fundamentals', route: RoutePaths.flutterFundamentals),
  Link(title: 'Dart fundamentals', route: RoutePaths.dartFundamentals),
  Link(title: 'UI', route: RoutePaths.ui),
  Link(title: 'Widget catalog', route: RoutePaths.widgetsCatalog),
  Link(title: 'Lifecycle', route: RoutePaths.lifecycle),
  Link(title: 'Navigation and routing', route: RoutePaths.navigationRouting),
  Link(title: 'State management', route: RoutePaths.stateManagement),
  Link(title: 'API handling', route: RoutePaths.apiHandling),
  Link(title: 'Database handling', route: RoutePaths.databaseHandling),
  Link(title: 'Exception handling', route: RoutePaths.exceptionHandling),
  Link(title: 'Architecture', route: RoutePaths.architecture),
  Link(title: 'Debugging', route: RoutePaths.debugging),
  Link(title: 'Testing', route: RoutePaths.testing),
  Link(title: 'Supporting classes and enums', route: RoutePaths.supportingClassesEnums),
  Link(title: 'Native device features', route: RoutePaths.nativeDeviceFeatures),
  Link(title: 'Notifications', route: RoutePaths.notification),
  Link(title: 'Widgets', route: RoutePaths.widget),
  Link(title: 'Other basics', route: RoutePaths.otherBasics),
  Link(title: 'Dependency management', route: RoutePaths.dependencyManagement),
  Link(title: 'Production build and deployment', route: RoutePaths.productionBuildDeployment),
  Link(title: 'Third party services', route: RoutePaths.thirdPartyServices),
  Link(title: 'Best practices', route: RoutePaths.bestPractices),
];
