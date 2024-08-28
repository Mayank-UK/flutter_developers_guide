import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/links.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../navigation/routes.dart';

class SupportingClassesEnumsView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'Supporting classes',
      description:
          'Classes that are used within widgets to provide additional functionality like decoration, etc.',
      route: RoutePaths.supportingClasses,
    ),
    Link(
      title: 'Supporting enums',
      description:
          'Enums that holds a group of values for different things like alignment, axis, etc.',
      route: RoutePaths.supportingEnums,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Supporting classes and enums",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
