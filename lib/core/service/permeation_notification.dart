import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PermeationNotification {
  final FlutterLocalNotificationsPlugin notifications =
      FlutterLocalNotificationsPlugin();

  Future<bool> checkNotificationPermission() async {
    final android = notifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    final granted = await android?.areNotificationsEnabled();

    return granted ?? false;
  }

  Future<void> requestNotificationPermission() async {
    final android = notifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    await android?.requestNotificationsPermission();
  }
}
