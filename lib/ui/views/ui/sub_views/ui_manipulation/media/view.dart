import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';

import '../../../../../components/main_appbar.dart';
import '../../../../../components/list.dart';
import '../../../../../../core/router/routes.dart';

class MediaView extends StatelessWidget {
  final List<ListViewItem> _itemList = [
    ListViewItem(
      title: 'Video',
      description: 'Playback of video.',
      route: RoutePaths.video,
    ),
    ListViewItem(
      title: 'Audio',
      description: 'Playback of audio.',
      route: RoutePaths.audio,
    ),
  ];

  final String _appBarTitle = 'Media';

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
