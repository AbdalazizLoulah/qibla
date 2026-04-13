import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:qibla/core/service/background_service.dart';

/// إشعار الأذان
Future showAzanNotification(String prayer) async {
  await notifications.show(
    id: 2,
    body: "حان الآن موعد الصلاة",
    payload: prayer,
    notificationDetails: const NotificationDetails(
      android: AndroidNotificationDetails(
        "azan_channel",
        "Azan",
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        sound: RawResourceAndroidNotificationSound('azan'),
        fullScreenIntent: true,
      ),
    ),
  );
}
