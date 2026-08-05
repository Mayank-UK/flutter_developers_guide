import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/links.dart';
import '../../../../../navigation/routes.dart';

class MediaView extends StatelessWidget {
  final List<Link> _itemList = [
    Link(
      title: 'Video',
      description: 'Embed and control video playback from assets or network.',
      route: RoutePaths.video,
    ),
    Link(
      title: 'Audio',
      description: 'Play sounds and music from files or network URLs.',
      route: RoutePaths.audio,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Media",
      mobileUi: [
        Links(
          itemList: _itemList,
        ),
      ],
    );
  }
}
