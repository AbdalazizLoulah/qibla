
import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:qibla/core/constant/color/app_color.dart';
import 'package:qibla/core/service/azan_service.dart';
import 'package:qibla/core/service/notification_service.dart';
import 'package:qibla/core/service/payer_counter.dart';
import 'package:qibla/core/service/prayer_service.dart';
import 'package:qibla/core/service/prayer_timer_service.dart';
import 'package:qibla/feature/home/view/widget/custom_container_timer.dart';


class CustomCounterAdan extends StatefulWidget {
  const CustomCounterAdan({super.key, required this.h});

  final double h;

  @override
  State<CustomCounterAdan> createState() => _CustomCounterAdanState();
}

class _CustomCounterAdanState extends State<CustomCounterAdan> {
  late PrayerController controller;

  Prayer? nextPrayer;
  Duration remaining = Duration.zero;
  @override
  void initState() {
    super.initState();

    final prayerService = PrayerService();
    final timerService = PrayerTimerService();
    final notificationService = NotificationService();
    // final azanService = AzanService();

    notificationService.init();

    controller = PrayerController(
      prayerService: prayerService,
      timerService: timerService,
      notificationService: notificationService,
      // azanService: azanService,
    );

    controller.start(
      onUpdate: (prayer, rem) {
        if (!mounted) return;

        setState(() {
          nextPrayer = prayer;
          remaining = rem;
        });
      },
    );
    
  }
  @override
void dispose() {
  controller.dispose();
  super.dispose();
}
String twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    int hours = remaining.inSeconds <= 0 ? 0 : remaining.inHours;
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
              nextPrayer != null
                    ? PrayerService.prayerName(nextPrayer!)
                    : "لا توجد صلاة الآن",
                
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

