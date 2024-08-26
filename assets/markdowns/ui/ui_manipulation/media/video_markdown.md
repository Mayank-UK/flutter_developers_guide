    import 'package:flutter/material.dart';
    import 'package:video_player/video_player.dart';

    class _VideoImplementation extends StatefulWidget {
    const _VideoImplementation({Key key}) : super(key: key);

    @override
        __VideoImplementationState createState() => __VideoImplementationState();
    }

    class __VideoImplementationState extends State<_VideoImplementation> {
        VideoPlayerController _videoController;

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
            return Container(
                height: 500,
                child: VideoPlayer(
                    _videoController,
                ),
            ),
        }
    }
