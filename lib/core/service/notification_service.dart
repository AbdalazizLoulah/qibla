import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notifications =
      FlutterLocalNotificationsPlugin();

  Future init() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');

    const settings = InitializationSettings(android: android);

    await notifications.initialize(settings: settings);
  }

  // Future updateNotification(String prayer, String time) async {
    
  //   const androidDetails = AndroidNotificationDetails(
  //     'prayer_channel',
  //     'Prayer Times',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //     silent: true,
  //     fullScreenIntent: true, 
  //   );
  //   const details = NotificationDetails(android: androidDetails);
  //   await notifications.show(
  //     id: 1,
  //     body: "$prayer بعد $time",
  //     notificationDetails: NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         "prayer_channel",
  //         "Prayer Times",
  //         importance: Importance.max,
  //         priority: Priority.high,
  //         ongoing: true,
  //         silent: true,
  //       ),
  //     ),
  //   );
  // }
}
