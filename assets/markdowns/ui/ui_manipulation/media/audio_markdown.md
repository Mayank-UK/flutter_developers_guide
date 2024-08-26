    import 'package:flutter/material.dart';
    import 'package:audioplayers/audioplayers.dart';

    class _AudioImplementation extends StatefulWidget {
        const _AudioImplementation({Key key}) : super(key: key);

        @override
        __AudioImplementationState createState() => __AudioImplementationState();
    }

    class __AudioImplementationState extends State<_AudioImplementation> {
        AudioPlayer _audioPlayer;
        AudioCache _audioCache;

        @override
        void initState() {
            super.initState();

            _audioPlayer = AudioPlayer();
            _audioCache = AudioCache(fixedPlayer: _audioPlayer);
            _audioPlayer.setReleaseMode(ReleaseMode.LOOP);
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
            _audioCache.play('audios/audio.mp3');
        }

        @override
        Widget build(BuildContext context) {
            return Container(
                child: ElevatedButton(
                    onPressed: _onTapPlay,
                    child: Text(
                        'Play audio',
                    ),
                ),
            ),
        }
    }
