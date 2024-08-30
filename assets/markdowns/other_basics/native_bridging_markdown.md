## flutter code

    class __NativeBridgingImplementationState extends State<_NativeBridgingImplementation> {
        static const MethodChannel _channel = MethodChannel('com.example/native');
        String _nativeData = '';
        bool _isLoading = false;
        String _errorMessage = '';

        Future<void> _getNativeData() async {
            setState(() {
                _isLoading = true;
                _errorMessage = '';
            });

            try {
                final String data = await _channel.invokeMethod('getNativeData');
                setState(() {
                    _nativeData = data;
                });
            } catch (e) {
                setState(() {
                    _errorMessage = 'Error calling native method: $e';
                });
            } finally {
                setState(() {
                    _isLoading = false;
                });
            }
        }

        @override
        Widget build(BuildContext context) {
            return Wrap(
                children: <Widget>[
                    SectionWrapper(
                        title: 'Basics',
                        content: [
                            TextBlock(
                                "Communicate with native platform functionalities using Flutter.",
                            ),
                            Column(
                                children: [
                                    ElevatedButton(
                                        onPressed: _getNativeData,
                                        child: Text('Fetch Native Data'),
                                    ),
                                    SizedBox(height: 20),
                                    if (_isLoading)
                                        Center(
                                            child: CircularProgressIndicator(),
                                    )
                                    else if (_errorMessage.isNotEmpty)
                                        Center(
                                            child: Text(_errorMessage),
                                    )
                                    else if (_nativeData.isNotEmpty)
                                        Center(
                                            child: Text('$_nativeData'),
                                    )
                                    else
                                        Center(
                                            child: Text('_'),
                                    ),
                                ],
                            )
                        ],
                    ),
                ],
            );
        }
    }

## android code

    package com.example.flutter_developers_guide

    import android.os.Bundle
    import android.util.Log
    import io.flutter.embedding.android.FlutterActivity
    import io.flutter.embedding.engine.FlutterEngine
    import io.flutter.plugin.common.MethodChannel

    class MainActivity : FlutterActivity() {
        private val CHANNEL = "com.example/native"

        override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
            super.configureFlutterEngine(flutterEngine)

            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
                .setMethodCallHandler { call, result ->
                    if (call.method == "getNativeData") {
                        val nativeData = getNativeData()
                        result.success(nativeData)
                    } else {
                        result.notImplemented()
                    }
                }
        }

        private fun getNativeData(): String {
            Log.d("MainActivity", "getNativeData called")
            return "Data from native Android"
        }
    }

## ios code

    import UIKit
    import Flutter
    import flutter_local_notifications

    @main
    @objc class AppDelegate: FlutterAppDelegate {
        private let CHANNEL = "com.example/native"

        override func application(
        _ application: UIApplication,
            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool {
            // Register plugins
            FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
            GeneratedPluginRegistrant.register(with: registry)
        }
        GeneratedPluginRegistrant.register(with: self)
            // Set up the method channel
            let flutterViewController = window?.rootViewController as! FlutterViewController
            let methodChannel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: flutterViewController.binaryMessenger)

            methodChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
                if call.method == "getNativeData" {
                    // Handle the method call from Flutter
                    let nativeData = self?.getNativeData()
                    result(nativeData)
                } else {
                    result(FlutterMethodNotImplemented)
                }
            }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
        }

        // Example method to return some data
        private func getNativeData() -> String {
            return "Data from native iOS"
        }
    }
