import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';
import '../../../../../../../components/text_block.dart';

class AudioView extends StatelessWidget {
  final String _appBarTitle = 'Audio';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/media/audio_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      mobileUi: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _AudioImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _AudioImplementation extends StatefulWidget {
  const _AudioImplementation({Key? key}) : super(key: key);

  @override
  __AudioImplementationState createState() => __AudioImplementationState();
}

class __AudioImplementationState extends State<_AudioImplementation> {
  late AudioPlayer _audioPlayer;
  late AudioCache _audioCache;

  @override
  void initState() {
    super.initState();

    _audioPlayer = AudioPlayer();
    // _audioCache = AudioCache(fixedPlayer: _audioPlayer);
    // _audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    _audioPlayer.onPlayerStateChanged.listen((s) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _audioPlayer.release();
    _audioPlayer.dispose();
    _audioCache.clearAll();

    super.dispose();
  }

  _onTapPlay() {
    _audioPlayer.release();
    // _audioCache.play('audios/audio.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'To play Audio from files and internet, add a popular Audio player package to \'pubspec.yaml\' file and follow it\'s implementation.',
            ),
            TextBlock(
              'This example uses \'audioplayer\' package.',
            ),
            TextBlock(
              'The setup involves creating a audio player object and audio cache object, specifying the audio source in this audio cache object.',
            ),
            Container(
              child: ElevatedButton(
                onPressed: _onTapPlay,
                child: Text(
                  'Play audio',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
