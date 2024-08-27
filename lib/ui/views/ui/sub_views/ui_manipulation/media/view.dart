import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/models/list_item.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/links.dart';
import '../../../../../../core/router/routes.dart';

class MediaView extends StatelessWidget {
  final List<LinkItem> _itemList = [
    LinkItem(
      title: 'Video',
      description: 'Playback of video.',
      route: RoutePaths.video,
    ),
    LinkItem(
      title: 'Audio',
      description: 'Playback of audio.',
      route: RoutePaths.audio,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Media",
      children: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
