import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';

import '../../../../core/router/routes.dart';

import '../../../components/main_appbar.dart';
import '../../../components/list.dart';

class AssetWidgetsView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
      title: 'AssetBundle',
      description:
          'Asset bundles contain resources, such as images and final Strings, that can be used by an application. Access to these resources is asynchronous so that they can be transparently loaded over a network (e.g., from a NetworkAssetBundle) or from the local file system without blocking the application\'s user interface.',
      route: RoutePaths.assetBundle,
    ),
    ListViewItem(
      title: 'Icon',
      description: 'A Material Design icon.',
      route: RoutePaths.icon,
    ),
    ListViewItem(
      title: 'Image',
      description: 'A widget that displays an image.',
      route: RoutePaths.image,
    ),
    ListViewItem(
      title: 'RawImage',
      description: 'A widget that displays a dart:ui.Image directly.',
      route: RoutePaths.rawImage,
    ),
  ];

  final String _appBarTitle = 'Asset widgets';

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
