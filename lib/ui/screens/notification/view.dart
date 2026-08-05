import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/section_wrapper.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Notifications',
      markdownPath: 'assets/markdowns/notification/notification_markdown.md',
      preview: _NotificationView(),
    );
  }
}

class _NotificationView extends StatefulWidget {
  const _NotificationView({super.key});

  @override
  State<_NotificationView> createState() => __NotificationViewState();
}

class __NotificationViewState extends State<_NotificationView> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  bool _hasNotificationPermission = false;

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    _initializeNotifications();
    _checkNotificationPermission();
  }

  void _initializeNotifications() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      // iOS: DarwinInitializationSettings(),
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  Future<void> _checkNotificationPermission() async {
    print("Checking notification permission");
    if (Platform.isIOS) {
      final settings = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );

      setState(() {
        _hasNotificationPermission = settings ?? false;
      });
    } else {
      final status = await Permission.notification.status;
      setState(() {
        _hasNotificationPermission = status.isGranted;
      });
    }
    print("Initial permission status: $_hasNotificationPermission");
  }

  Future<void> _requestNotificationPermission() async {
    print("Requesting notification permission");
    if (Platform.isIOS) {
      final bool? result = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      setState(() {
        _hasNotificationPermission = result ?? false;
      });
    } else {
      final status = await Permission.notification.request();
      setState(() {
        _hasNotificationPermission = status.isGranted;
      });
    }
    print("Permission request result: $_hasNotificationPermission");
  }

  Future<void> onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    print("Notification received: ${notificationResponse.payload}");
  }

  Future<void> onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    print("Local notification received: $title, $body, $payload");
  }

  Future<void> _scheduleNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'simple_channel_id',
      'Simple Channel',
      channelDescription: 'A simple channel description',
      importance: Importance.max,
      priority: Priority.high,
    );

    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    if (Theme.of(context).platform == TargetPlatform.android) {
      await flutterLocalNotificationsPlugin.show(
        0,
        'Simple Notification',
        'This is a simple notification',
        platformChannelSpecifics,
      );
    } else {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Scheduled Notification',
        'This is a scheduled notification',
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        platformChannelSpecifics,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    }
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
              "For iOS, the notification is scheduled 5 seconds in the future.",
            ),
            TextBlock(
              "Notification functionality needs to be registered in manifest and info.plist files before using them.",
            ),
            TextBlock(
              "Note: for ios, by default it won't show the notification if the app is open, so for this example notification is scheduled 5 seconds after button is pressed. To test it close the app after button press.",
            ),
            Center(
              child: _hasNotificationPermission
                  ? ElevatedButton(
                      onPressed: _scheduleNotification,
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
