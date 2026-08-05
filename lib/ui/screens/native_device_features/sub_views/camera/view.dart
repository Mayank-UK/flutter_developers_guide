import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';
import 'package:camera/camera.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';


import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class CameraView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Camera',
      markdownPath: 'assets/markdowns/native_device_features/camera_markdown.md',
      preview: _CameraImplementation(),
    );
  }
}

class _CameraImplementation extends StatefulWidget {
  @override
  __CameraImplementationState createState() => __CameraImplementationState();
}

class __CameraImplementationState extends State<_CameraImplementation> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  late List<CameraDescription> _cameras;
  int _cameraIndex = 0;
  bool _isFrontCameraOn = false;
  bool _isFlashOn = false;
  late VideoPlayerController _videoController;
  late XFile _videoPath;

  @override
  void initState() {
    super.initState();

    this._initializedCamera();
  }

  _initializedCamera() async {
    _cameras = await availableCameras();

    this._cameraIndex = this._isFrontCameraOn ? 1 : 0;

    this._cameraController = CameraController(
      this._cameras[_cameraIndex],
      ResolutionPreset.medium,
    );

    this._initializeControllerFuture = this._cameraController.initialize();

    this._cameraController.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();

    super.dispose();
  }

  Future<void> _startRecording() async {
    await _cameraController.startVideoRecording();
  }

  void _finishRecording() {
    setState(() async {
      _videoPath = await _cameraController.stopVideoRecording();

      _videoController = VideoPlayerController.file(File(_videoPath.path))
        ..initialize().then(
          (value) {
            _videoController.play();
            _videoController.setLooping(true);

            setState(() {});
          },
        );
    });
  }

  void _onTapFlipCamera() {
    setState(() {
      this._isFrontCameraOn = !this._isFrontCameraOn;
    });

    _initializedCamera();
  }

  void _onTapFlash() {
    setState(() {
      this._isFlashOn = !this._isFlashOn;
    });

    if (_isFlashOn) {
      _cameraController.setFlashMode(FlashMode.torch);
      return;
    }

    _cameraController.setFlashMode(FlashMode.off);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'To use camera, add a popular camera package to "pubspec.yaml" file and follow it\'s implementation. This example uses "camera" package.',
            ),
            TextBlock(
              'The setup involves creating a controller for camera and using "CameraPreview" widget to preview the camera.',
            ),
            Container(
              height: 600,
              child: (_cameraController != null && _videoController == null)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 500,
                          width: double.infinity,
                          child: FutureBuilder<void>(
                            future: this._initializeControllerFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return CameraPreview(
                                  this._cameraController,
                                );
                              } else {
                                return Container(
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 16,
                          ),
                          child: (_cameraController.value.isRecordingVideo)
                              ? ElevatedButton(
                                  onPressed: _finishRecording,
                                  child: Text('Finish recording'),
                                )
                              : Wrap(
                                  spacing: 8,
                                  children: [
                                    ElevatedButton(
                                      onPressed: _startRecording,
                                      child: Text('Start recording'),
                                    ),
                                    ElevatedButton(
                                      onPressed: _onTapFlipCamera,
                                      child: Icon(
                                        Icons.flip_camera_ios,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: _onTapFlash,
                                      child: Icon(
                                        this._isFlashOn
                                            ? Icons.flash_off
                                            : Icons.flash_on,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ],
                    )
                  : Container(
                      child: (_videoController != null)
                          ? VideoPlayer(_videoController)
                          : Container(),
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
