import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../navigation/routes.dart';
import '../../../components/links.dart';

class AccessibilityWidgetsView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'ExcludeSemantics',
      description:
          'A widget that drops all the semantics of its descendants. This can be used to hide subwidgets that would otherwise be reported but that would only be confusing. For example, the Material Components Chip widget hides the avatar since it is redundant with the chip label.',
      route: RoutePaths.excludeSemanticsWidget,
    ),
    Link(
      title: 'MergeSemantics',
      description: 'A widget that merges the semantics of its descendants.',
      route: RoutePaths.mergeSemanticsWidget,
    ),
    Link(
      title: 'Semantics',
      description:
          'A widget that annotates the widget tree with a description of the meaning of the widgets. Used by accessibility tools, search engines, and other semantic analysis software to determine the meaning of the application.',
      route: RoutePaths.semanticsWidget,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Accessibility widgets",
      mobileUi: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
