import 'dart:async';
import 'dart:ui';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:qibla/core/service/get_location.dart';
import 'package:qibla/core/service/prayer_service.dart';

@pragma('vm:entry-point')
void onStart() async {
  DartPluginRegistrant.ensureInitialized();

  

  final notifications = FlutterLocalNotificationsPlugin();

  const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
  const settings = InitializationSettings(android: androidInit);

  await notifications.initialize(settings: settings);

  final repeatPlayer = AudioPlayer();
  await repeatPlayer.setReleaseMode(ReleaseMode.loop);
  await repeatPlayer.play(AssetSource('audio/صلى على النبى.m4a'));

  Position position = await GetLocation.getLocation();

  final coordinates = Coordinates(position.latitude, position.longitude);
  final params = CalculationMethodParameters.egyptian();

  PrayerTimes prayerTimes = PrayerTimes(
    date: DateTime.now(),
    coordinates: coordinates,
    calculationParameters: params,
  );

  Prayer nextPrayer = prayerTimes.nextPrayer();
  DateTime nextTime = prayerTimes.timeForPrayer(nextPrayer);

  bool azanPlayed = false;

  Timer.periodic(const Duration(seconds: 30), (timer) async {
    final remaining = nextTime.difference(DateTime.now());

    if (remaining.inSeconds <= 0 && !azanPlayed) {
      azanPlayed = true;

      String prayerName = PrayerService.prayerName(nextPrayer);

      await notifications.show(
      id:   2,
        title:  "حان الآن موعد الصلاة",
        body:  prayerName,
        notificationDetails:  const NotificationDetails(
          android: AndroidNotificationDetails(
            "azan_channel",
            "Azan",
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
      );

      final azanPlayer = AudioPlayer();
      await azanPlayer.play(AssetSource('audio/019--1.mp3'));

      prayerTimes = PrayerTimes(
        date: DateTime.now(),
        coordinates: coordinates,
        calculationParameters: params,
      );

      nextPrayer = prayerTimes.nextPrayer();
      nextTime = prayerTimes.timeForPrayer(nextPrayer);

      azanPlayed = false;
    }
  });
}
