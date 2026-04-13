import 'dart:async';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

import 'package:qibla/core/service/notification_service.dart';
import 'package:qibla/core/service/permeation_notification.dart';
import 'package:qibla/core/service/prayer_service.dart';
import 'package:qibla/core/service/prayer_timer_service.dart';
import 'package:qibla/feature/splash/view/widget/splash_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  StreamSubscription<ServiceStatus>? serviceStatusStream;

  bool dialogOpen = false;
  final prayerService = PrayerService();
  // final azanService = AzanService();
  final notificationService = NotificationService();
  final timerService = PrayerTimerService();
  Prayer? nextPrayer;
  Duration remaining = Duration.zero;
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  @override
  void initState() {
    super.initState();
    notificationService.init();
    loadPrayer();
    checkLocation();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      askNotificationPermission();
    });
  }

  void askNotificationPermission() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("تشغيل الإشعارات"),
        content: Text("محتاجين الإشعارات عشان الأذان يشتغل في معاده"),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await PermeationNotification().requestNotificationPermission();
            },
            child: Text("موافق"),
          ),
        ],
      ),
    );
  }

  Future loadPrayer() async {
    final result = await prayerService.getNextPrayer();

    Prayer? prayer = result.$1;
    DateTime? time = result.$2;

    if (!mounted) return;

    setState(() {
      nextPrayer = prayer;
    });

    timerService.startTimer(
      nextPrayerTime: time!,
      onTick: (remaining) {
        String t =
            "${twoDigits(remaining.inHours)}:"
            "${twoDigits(remaining.inMinutes.remainder(60))}:"
            "${twoDigits(remaining.inSeconds.remainder(60))}";

        // notificationService.updateNotification(
        //   PrayerService.prayerName(prayer!),
        //   t,
        // );

        if (!mounted) return;

        setState(() {
          this.remaining = remaining;
        });
      },
      onFinish: () async {
        // await azanService.playAzan();

        if (!mounted) return;

        loadPrayer();
      },
    );
  }

  Future<void> checkLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      showLocationDialog();
    } else {
      Future.delayed(Duration(seconds: 6), () {
        context.go("/home");
      });
    }

    serviceStatusStream = Geolocator.getServiceStatusStream().listen((
      ServiceStatus status,
    ) {
      if (status == ServiceStatus.enabled) {
        if (dialogOpen) {
          Navigator.pop(context); // يقفل الرسالة
        }
        Future.delayed(Duration(seconds: 6), () {
          context.go("/home");
        }); // يفتح الصفحة
      }
    });
  }

  Future<void> showLocationDialog() async {
    // dialogOpen = true;
    final granted =
      await PermeationNotification().checkNotificationPermission();
    if (granted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: const Text("تشغيل الموقع"),
          content: const Text(
            "من فضلك فعل الموقع للحصول على مواقيت الصلاة بدقة",
          ),
          actions: [
            TextButton(
              onPressed: () async {
                await Geolocator.openLocationSettings();
              },
              child: const Text("فتح الإعدادات"),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    serviceStatusStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashBody());
  }
}


