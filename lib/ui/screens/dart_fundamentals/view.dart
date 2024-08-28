import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../navigation/routes.dart';
import '../../components/links.dart';

class DartFundamentalsView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'Important concepts',
      description: 'Important facts and information about dart.',
      route: RoutePaths.importantConcepts,
    ),
    Link(
      title: 'Installation',
      description: 'Using dart on your system.',
      route: RoutePaths.installation,
    ),
    Link(
      title: 'Keywords',
      description: 'The words with special meanings.',
      route: RoutePaths.keywords,
    ),
    Link(
      title: 'Variables',
      description: 'Storing references.',
      route: RoutePaths.variables,
    ),
    Link(
      title: 'Build-in types',
      description: 'Support of common data types.',
      route: RoutePaths.buildInTypes,
    ),
    Link(
      title: 'Functions',
      description: 'Reusable block of code.',
      route: RoutePaths.functions,
    ),
    Link(
      title: 'Operators',
      description: 'Special symbols with predefined operations.',
      route: RoutePaths.operators,
    ),
    Link(
      title: 'Cascade notation',
      description: 'Cascade a sequence of operations on an object.',
      route: RoutePaths.cascadeNotation,
    ),
    Link(
      title: 'Control flow statements',
      description: 'For complex logic building.',
      route: RoutePaths.controlFlowStatements,
    ),
    Link(
      title: 'Exceptions',
      description: 'Catch and handle unexpected exceptions.',
      route: RoutePaths.exceptions,
    ),
    Link(
      title: 'Classes',
      description: 'Blueprint for an object.',
      route: RoutePaths.classes,
    ),
    Link(
      title: 'Generics',
      description: 'Writing type safe code.',
      route: RoutePaths.generics,
    ),
    Link(
      title: 'Libraries and visibility',
      description: 'Predefined code available for most common tasks.',
      route: RoutePaths.librariesVisibility,
    ),
    Link(
      title: 'Asynchrony support',
      description: 'Asynchronous code',
      route: RoutePaths.asynchrony,
    ),
    Link(
      title: 'Generators',
      description: 'Lazily produce a sequence of values',
      route: RoutePaths.generators,
    ),
    Link(
      title: 'Callable classes',
      description: 'Calling objects like a function.',
      route: RoutePaths.callableClasses,
    ),
    Link(
      title: 'Isolates',
      description: 'Taking advantage of multi-core CPU/\'s',
      route: RoutePaths.isolates,
    ),
    Link(
      title: 'Typedefs',
      description: 'Give function type a name.',
      route: RoutePaths.typedefs,
    ),
    Link(
      title: 'Comments',
      description: 'Provide additional information.',
      route: RoutePaths.comments,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Dart fundamentals",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
