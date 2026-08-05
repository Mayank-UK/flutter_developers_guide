import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/links.dart';
import '../../../../../navigation/routes.dart';

class ColorsBackgroundsView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'Text Color',
      description: 'Color text per element, per section, or app-wide via theme.',
      route: RoutePaths.colors,
    ),
    Link(
      title: 'Background',
      description: 'Background color for a widget, a page, or the whole app.',
      route: RoutePaths.backgrounds,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Colors and backgrounds",
      mobileUi: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
