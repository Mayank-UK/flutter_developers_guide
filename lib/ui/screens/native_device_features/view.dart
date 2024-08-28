import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../navigation/routes.dart';
import '../../components/links.dart';

class NativeDeviceFeaturesView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
      title: 'Bluetooth',
      description: 'Using the bluetooth of the device.',
      route: RoutePaths.bluetooth,
    ),
    LinkItem(
      title: 'Camera',
      description: 'Using the camera of the device.',
      route: RoutePaths.camera,
    ),
    LinkItem(
      title: 'Filesystem',
      description: 'Using the filesystem of the device.',
      route: RoutePaths.fileSystem,
    ),
    LinkItem(
      title: 'Location',
      description: 'Using the location and gps of the device.',
      route: RoutePaths.location,
    ),
    LinkItem(
      title: 'Share',
      description: 'Sharing data with other apps and websites.',
      route: RoutePaths.share,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Native device features",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
