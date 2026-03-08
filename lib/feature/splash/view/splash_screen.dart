import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:qibla/feature/splash/view/widget/splash_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  StreamSubscription<ServiceStatus>? serviceStatusStream;
  bool dialogOpen = false;

  @override
  void initState() {
    super.initState();
    checkLocation();
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

  void showLocationDialog() {
    dialogOpen = true;

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
class CheckLocation{
  
}