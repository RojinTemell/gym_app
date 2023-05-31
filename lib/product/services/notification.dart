import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initializeNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(int id, String title, String body) async {
    await flutterLocalNotificationsPlugin.periodicallyShow(
        id,
        title,
        body,
        RepeatInterval.everyMinute,
        NotificationDetails(
          android: AndroidNotificationDetails(
            id.toString(),
            "Go to Bed",
            importance: Importance.max,
            priority: Priority.max,
            icon: '@mipmap/ic_launcher',
          ),
          iOS: const IOSNotificationDetails(
            sound: 'default.wav',
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        androidAllowWhileIdle: true);
  }

  Future<void> cancelNotfication() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
