import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/links.dart';
import '../../../../../navigation/routes.dart';

class MediaView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'Video',
      description: 'Playback of video.',
      route: RoutePaths.video,
    ),
    Link(
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
