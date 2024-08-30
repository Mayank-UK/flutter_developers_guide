import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/code_preview_tabs.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/components/section_wrapper.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/notification/notification_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Notifications',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _NotificationView(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _NotificationView extends StatefulWidget {
  const _NotificationView({super.key});

  @override
  State<_NotificationView> createState() => __NotificationViewState();
}

class __NotificationViewState extends State<_NotificationView> {
  // late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  // @override
  // void initState() {
  //   super.initState();

  //   const AndroidInitializationSettings initializationSettingsAndroid =
  //       AndroidInitializationSettings('@mipmap/ic_launcher');

  //   const InitializationSettings initializationSettings =
  //       InitializationSettings(android: initializationSettingsAndroid);

  //   flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  //   flutterLocalNotificationsPlugin
  //       .initialize(initializationSettings)
  //       .then((_) {
  //     print("Initialization successful");
  //   }).catchError((error) {
  //     print("Error during initialization: $error");
  //   });
  // }

  // Future<void> _showNotification() async {
  //   try {
  //     const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //         AndroidNotificationDetails(
  //       'your_channel_id',
  //       'your_channel_name',
  //       channelDescription: 'your_channel_description',
  //       importance: Importance.max,
  //       priority: Priority.high,
  //     );

  //     const NotificationDetails platformChannelSpecifics =
  //         NotificationDetails(android: androidPlatformChannelSpecifics);

  //     await flutterLocalNotificationsPlugin.show(
  //       0,
  //       'Test Notification',
  //       'This is the notification content',
  //       platformChannelSpecifics,
  //       payload: 'item x',
  //     );
  //     print("Notification shown successfully");
  //   } catch (e) {
  //     print("Error showing notification: $e");
  //   }
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Wrap(
  //     children: [
  //       SectionWrapper(
  //         title: 'Basics',
  //         content: [
  //           TextBlock(
  //             'Show notification in the app. It is implemented using 3rd party plugin.',
  //           ),
  //           TextBlock(
  //             "At the time of testing there's no error in console, but notification did not work",
  //           ),
  //           Center(
  //             child: ElevatedButton(
  //               onPressed: _showNotification,
  //               child: Text('Send Notification'),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  bool _hasNotificationPermission = false;

  @override
  void initState() {
    super.initState();
    _checkNotificationPermission();
  }

  Future<void> _checkNotificationPermission() async {
    // Check the notification permission status
    if (await Permission.notification.isGranted) {
      setState(() {
        _hasNotificationPermission = true;
      });
      _initializeNotifications();
    } else {
      _requestNotificationPermission();
    }
  }

  Future<void> _requestNotificationPermission() async {
    PermissionStatus status = await Permission.notification.request();

    if (status.isGranted) {
      setState(() {
        _hasNotificationPermission = true;
      });
      _initializeNotifications();
    } else {
      setState(() {
        _hasNotificationPermission = false;
      });
    }
  }

  void _initializeNotifications() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'simple_channel_id',
      'Simple Channel',
      channelDescription: 'A simple channel description',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Simple Notification',
      'This is a simple notification',
      platformChannelSpecifics,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SectionWrapper(
          title: 'Basics',
          content: [
            TextBlock(
              'Show notification in the app. It is implemented using 3rd party plugin.',
            ),
            TextBlock(
              "At the time of testing there's no error in console, but notification did not work",
            ),
            Center(
              child: _hasNotificationPermission
                  ? ElevatedButton(
                      onPressed: _showNotification,
                      child: Text('Send Notification'),
                    )
                  : ElevatedButton(
                      onPressed: _requestNotificationPermission,
                      child: Text('Request Notification Permission'),
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
