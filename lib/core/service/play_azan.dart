import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> playAzan(dynamic prayerName) async {
  final player = AudioPlayer();
  await player.play(AssetSource('audio/019--1.mp3'));
  NotificationAzan notificationAzan = NotificationAzan();
  notificationAzan.notificationAzan(prayerName);
}

class NotificationAzan {
  final FlutterLocalNotificationsPlugin notifications =
      FlutterLocalNotificationsPlugin();
  Future notificationAzan(String prayer) async {
    await notifications.show(
      id: 1,
      title: "الاذان",
      body: "$prayer حان الان موعد الصلاه",
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          "prayer_channel",
          "Prayer Times",
          importance: Importance.max,
          priority: Priority.high,
          ongoing: true,
          playSound: true,
          actions: <AndroidNotificationAction>[
            AndroidNotificationAction('mute', 'كتم'),
            AndroidNotificationAction('stop', 'إيقاف'),
          ],
        ),
      ),
    );
  }
}
