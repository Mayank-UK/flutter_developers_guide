import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../navigation/routes.dart';

import '../../../components/links.dart';

class AssetWidgetsView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'AssetBundle',
      description:
          'Asset bundles contain resources, such as images and final Strings, that can be used by an application. Access to these resources is asynchronous so that they can be transparently loaded over a network (e.g., from a NetworkAssetBundle) or from the local file system without blocking the application\'s user interface.',
      route: RoutePaths.assetBundle,
    ),
    Link(
      title: 'Icon',
      description: 'A Material Design icon.',
      route: RoutePaths.icon,
    ),
    Link(
      title: 'Image',
      description: 'A widget that displays an image.',
      route: RoutePaths.image,
    ),
    Link(
      title: 'RawImage',
      description: 'A widget that displays a dart:ui.Image directly.',
      route: RoutePaths.rawImage,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Asset widgets",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
