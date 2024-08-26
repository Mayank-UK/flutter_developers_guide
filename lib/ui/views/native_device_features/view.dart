import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';

import '../../components/main_appbar.dart';
import '../../../core/router/routes.dart';
import '../../components/list.dart';

class NativeDeviceFeaturesView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
      title: 'Bluetooth',
      description: 'Using the bluetooth of the device.',
      route: RoutePaths.bluetooth,
    ),
    ListViewItem(
      title: 'Camera',
      description: 'Using the camera of the device.',
      route: RoutePaths.camera,
    ),
    ListViewItem(
      title: 'Filesystem',
      description: 'Using the filesystem of the device.',
      route: RoutePaths.fileSystem,
    ),
    ListViewItem(
      title: 'Location',
      description: 'Using the location and gps of the device.',
      route: RoutePaths.location,
    ),
    ListViewItem(
      title: 'Share',
      description: 'Sharing data with other apps and websites.',
      route: RoutePaths.share,
    ),
  ];

  final String _appBarTitle = 'Native device features';

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
