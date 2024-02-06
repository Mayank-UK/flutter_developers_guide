import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../components/code_preview_component.dart';
import './../../../../components/section_wrapper_component_component.dart';
import './../../../../components/text_block_component.dart';

class VideoView extends StatelessWidget {
  final String _appBarTitle = 'Video';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui_manipulation/media/video_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabsComponent(
      appBarTitle: this._appBarTitle,
      previewTab: _VideoImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _VideoImplementation extends StatefulWidget {
  const _VideoImplementation({Key? key}) : super(key: key);

  @override
  __VideoImplementationState createState() => __VideoImplementationState();
}

class __VideoImplementationState extends State<_VideoImplementation> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/videos/video.mp4')
      ..initialize().then(
        (value) {
          _videoController.play();
          _videoController.setLooping(true);

          setState(() {});
        },
      );
  }

  @override
  void dispose() {
    _videoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapperComponent(
          title: 'Simple use',
          content: [
            TextBlockComponent(
              'To play video from files and internet, add a popular video player package to \'pubspec.yaml\' file and follow it\'s implementation.',
            ),
            TextBlockComponent(
              'This example uses \'video_player\' package.',
            ),
            TextBlockComponent(
              'The setup involves creating a controller for video player, specifying the video source in this controller and passing this controller to \'VideoPlayer\' widget.',
            ),
            Container(
              height: 500,
              child: VideoPlayer(
                _videoController,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
