import 'dart:async';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:qibla/core/constant/color/app_color.dart';
import 'package:qibla/feature/home/view/widget/custom_container_timer.dart';

class CustomCounterAdan extends StatefulWidget {
  const CustomCounterAdan({super.key, required this.h});

  final double h;

  @override
  State<CustomCounterAdan> createState() => _CustomCounterAdanState();
}

class _CustomCounterAdanState extends State<CustomCounterAdan> {
  Prayer? nextPrayer;
  Duration remaining = Duration.zero;
  final player = AudioPlayer();

  Timer? timer;

  @override
  void initState() {
    super.initState();
    loadPrayer();
    initNotification();

    DateTime nextPrayer = DateTime.now().add(const Duration(minutes: 10));

    startPrayerTimer(nextPrayer , "المغرب");
  }

  Future playAzan() async {
    await player.play(AssetSource('audio/019--1.mp3'));
  }

  Future loadPrayer() async {
    /// permission
    LocationPermission permission = await Geolocator.requestPermission();

    /// location
    Position position = await Geolocator.getCurrentPosition();

    final coordinates = Coordinates(position.latitude, position.longitude);

    final params = CalculationMethodParameters.egyptian();

    final prayerTimes = PrayerTimes(
      date: DateTime.now(),
      coordinates: coordinates,
      calculationParameters: params,
    );

    Prayer? next = prayerTimes.nextPrayer();

    DateTime nextTime = prayerTimes.timeForPrayer(next!)!;

    setState(() {
      nextPrayer = next;
      remaining = nextTime.difference(DateTime.now());
    });

    startPrayerTimer( nextTime, prayerName.toString());
  }

  void startPrayerTimer(DateTime nextPrayerTime, String prayerName) {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      Duration remaining = nextPrayerTime.difference(DateTime.now());

      if (remaining.inSeconds <= 0) {
        playAzan(); // تشغيل الأذان

        timer?.cancel();

        loadPrayer(); // حساب الصلاة التالية

        return;
      }

      String time =
          "${remaining.inMinutes.remainder(60).toString().padLeft(2, '0')}:"
          "${remaining.inSeconds.remainder(60).toString().padLeft(2, '0')}";

      // تحديث الإشعار
      updateNotification(prayerName, time);

      // لو عندك UI تعرضه
      setState(() {
        remaining = remaining;
      });
    });
  }

  String prayerName(Prayer? prayer) {
    switch (prayer) {
      case Prayer.fajr:
        return "الفجر";
      case Prayer.dhuhr:
        return "الظهر";
      case Prayer.asr:
        return "العصر";
      case Prayer.maghrib:
        return "المغرب";
      case Prayer.isha:
        return "العشاء";
      default:
        return "";
    }
  }

  final FlutterLocalNotificationsPlugin notifications =
      FlutterLocalNotificationsPlugin();

  Future updateNotification(String prayer, String time) async {
    await notifications.show(
      id: 1,
      body: "$prayer بعد $time",
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          "prayer_channel",
          "Prayer Times",
          importance: Importance.max,
          priority: Priority.high,
          ongoing: true, // يخليها ثابتة
        ),
      ),
    );
  }

  Future initNotification() async {
    const AndroidInitializationSettings android = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const InitializationSettings settings = InitializationSettings(
      android: android,
    );

    await notifications.initialize(settings: settings);
  }

  String twoDigits(int n) => n.toString().padLeft(2, "0");

  @override
  Widget build(BuildContext context) {
    int hours = remaining.inHours;
    int minutes = remaining.inMinutes.remainder(60);
    int seconds = remaining.inSeconds.remainder(60);
    return Container(
      height: widget.h * 0.28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 5), // اتجاه الشادو
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  "الصلاة القادمة",
                  style: TextStyle(fontSize: widget.h * 0.025),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: widget.h * 0.01),
                  child: Container(
                    height: widget.h * 0.04,
                    width: widget.h * 0.04,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColor.green,
                    ),
                    child: Icon(Icons.access_time, size: widget.h * 0.025),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(widget.h * 0.02),
              child: Text(
                prayerName(nextPrayer),
                style: TextStyle(
                  fontSize: widget.h * 0.03,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightGreen,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomContainerTimer(
                  h: widget.h,
                  title: "ساعة",
                  time: twoDigits(hours).toString(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: widget.h * 0.01),
                  child: Text(
                    ":",
                    style: TextStyle(
                      fontSize: widget.h * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                CustomContainerTimer(
                  h: widget.h,
                  title: "دقيقة",
                  time: twoDigits(minutes).toString(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: widget.h * 0.01),
                  child: Text(
                    ":",
                    style: TextStyle(
                      fontSize: widget.h * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                CustomContainerTimer(
                  h: widget.h,
                  title: "ثانية",
                  time: twoDigits(seconds).toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
