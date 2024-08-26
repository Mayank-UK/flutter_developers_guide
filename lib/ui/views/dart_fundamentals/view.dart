import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';

import '../../components/main_appbar.dart';
import '../../../core/router/routes.dart';
import '../../components/list.dart';

class DartFundamentalsView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
      title: 'Important concepts',
      description: 'Important facts and information about dart.',
      route: RoutePaths.importantConcepts,
    ),
    ListViewItem(
      title: 'Installation',
      description: 'Using dart on your system.',
      route: RoutePaths.installation,
    ),
    ListViewItem(
      title: 'Keywords',
      description: 'The words with special meanings.',
      route: RoutePaths.keywords,
    ),
    ListViewItem(
      title: 'Variables',
      description: 'Storing references.',
      route: RoutePaths.variables,
    ),
    ListViewItem(
      title: 'Build-in types',
      description: 'Support of common data types.',
      route: RoutePaths.buildInTypes,
    ),
    ListViewItem(
      title: 'Functions',
      description: 'Reusable block of code.',
      route: RoutePaths.functions,
    ),
    ListViewItem(
      title: 'Operators',
      description: 'Special symbols with predefined operations.',
      route: RoutePaths.operators,
    ),
    /* ListViewItem(
      title: 'Conditional expressions',
      description: 'Concisely evaluate if-else.',
      route: RoutePaths.conditionalExpression,
    ), */
    ListViewItem(
      title: 'Cascade notation',
      description: 'Cascade a sequence of operations on an object.',
      route: RoutePaths.cascadeNotation,
    ),
    ListViewItem(
      title: 'Control flow statements',
      description: 'For complex logic building.',
      route: RoutePaths.controlFlowStatements,
    ),
    ListViewItem(
      title: 'Exceptions',
      description: 'Catch and handle unexpected exceptions.',
      route: RoutePaths.exceptions,
    ),
    ListViewItem(
      title: 'Classes',
      description: 'Blueprint for an object.',
      route: RoutePaths.classes,
    ),
    ListViewItem(
      title: 'Generics',
      description: 'Writing type safe code.',
      route: RoutePaths.generics,
    ),
    ListViewItem(
      title: 'Libraries and visibility',
      description: 'Predefined code available for most common tasks.',
      route: RoutePaths.librariesVisibility,
    ),
    ListViewItem(
      title: 'Asynchrony support',
      description: 'Asynchronous code',
      route: RoutePaths.asynchrony,
    ),
    ListViewItem(
      title: 'Generators',
      description: 'Lazily produce a sequence of values',
      route: RoutePaths.generators,
    ),
    ListViewItem(
      title: 'Callable classes',
      description: 'Calling objects like a function.',
      route: RoutePaths.callableClasses,
    ),
    ListViewItem(
      title: 'Isolates',
      description: 'Taking advantage of multi-core CPU/\'s',
      route: RoutePaths.isolates,
    ),
    ListViewItem(
      title: 'Typedefs',
      description: 'Give function type a name.',
      route: RoutePaths.typedefs,
    ),
    ListViewItem(
      title: 'Comments',
      description: 'Provide additional information.',
      route: RoutePaths.comments,
    ),
  ];

  final String _appBarTitle = 'Dart fundamentals';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: Links(
        itemList: _itemList,
      ),
    );
  }
}
