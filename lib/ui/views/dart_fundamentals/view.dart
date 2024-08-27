import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../core/router/routes.dart';
import '../../components/links.dart';

class DartFundamentalsView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
      title: 'Important concepts',
      description: 'Important facts and information about dart.',
      route: RoutePaths.importantConcepts,
    ),
    LinkItem(
      title: 'Installation',
      description: 'Using dart on your system.',
      route: RoutePaths.installation,
    ),
    LinkItem(
      title: 'Keywords',
      description: 'The words with special meanings.',
      route: RoutePaths.keywords,
    ),
    LinkItem(
      title: 'Variables',
      description: 'Storing references.',
      route: RoutePaths.variables,
    ),
    LinkItem(
      title: 'Build-in types',
      description: 'Support of common data types.',
      route: RoutePaths.buildInTypes,
    ),
    LinkItem(
      title: 'Functions',
      description: 'Reusable block of code.',
      route: RoutePaths.functions,
    ),
    LinkItem(
      title: 'Operators',
      description: 'Special symbols with predefined operations.',
      route: RoutePaths.operators,
    ),
    LinkItem(
      title: 'Cascade notation',
      description: 'Cascade a sequence of operations on an object.',
      route: RoutePaths.cascadeNotation,
    ),
    LinkItem(
      title: 'Control flow statements',
      description: 'For complex logic building.',
      route: RoutePaths.controlFlowStatements,
    ),
    LinkItem(
      title: 'Exceptions',
      description: 'Catch and handle unexpected exceptions.',
      route: RoutePaths.exceptions,
    ),
    LinkItem(
      title: 'Classes',
      description: 'Blueprint for an object.',
      route: RoutePaths.classes,
    ),
    LinkItem(
      title: 'Generics',
      description: 'Writing type safe code.',
      route: RoutePaths.generics,
    ),
    LinkItem(
      title: 'Libraries and visibility',
      description: 'Predefined code available for most common tasks.',
      route: RoutePaths.librariesVisibility,
    ),
    LinkItem(
      title: 'Asynchrony support',
      description: 'Asynchronous code',
      route: RoutePaths.asynchrony,
    ),
    LinkItem(
      title: 'Generators',
      description: 'Lazily produce a sequence of values',
      route: RoutePaths.generators,
    ),
    LinkItem(
      title: 'Callable classes',
      description: 'Calling objects like a function.',
      route: RoutePaths.callableClasses,
    ),
    LinkItem(
      title: 'Isolates',
      description: 'Taking advantage of multi-core CPU/\'s',
      route: RoutePaths.isolates,
    ),
    LinkItem(
      title: 'Typedefs',
      description: 'Give function type a name.',
      route: RoutePaths.typedefs,
    ),
    LinkItem(
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
