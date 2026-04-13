import 'dart:async';


import 'package:adhan_dart/adhan_dart.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:qibla/core/constant/color/app_color.dart';
import 'package:qibla/core/service/get_location.dart';

import 'package:qibla/feature/sepha/view/widgets/custom_app_bar.dart';


class SalahBody extends StatefulWidget {
  const SalahBody({super.key});

  @override
  State<SalahBody> createState() => _SalahBodyState();
}

class _SalahBodyState extends State<SalahBody> {
  PrayerTimes? prayerTimes;
  DateTime now = DateTime.now();
  Timer? timer;
  GetLocation getLocation = GetLocation();
  Future<void> loadPrayerTimes() async {
    Position position = await GetLocation.getLocation();

    final coordinates = Coordinates(position.latitude, position.longitude);
    final params = CalculationMethodParameters.egyptian();

    prayerTimes = PrayerTimes(
      coordinates: coordinates,
      date: DateTime.now(),
      calculationParameters: params,
    );
    
    if (!mounted) return;

    setState(() {});
  }

  String formatTime(DateTime time) {
    int hour = time.hour;
    int minute = time.minute;

    String period = hour >= 12 ? "م" : "ص";

    hour = hour % 12;
    if (hour == 0) hour = 12;

    return "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period";
  }

  String remainingTime(DateTime prayerTime) {
    Duration diff = prayerTime.difference(now);

    if (diff.isNegative) {
      return "انتهت";
    }

    int h = diff.inHours;
    int m = diff.inMinutes.remainder(60);
    int s = diff.inSeconds.remainder(60);

    return "$h:$m:$s";
  }


  @override
  List<Map<String, dynamic>> get prayers {
    if (prayerTimes == null) return [];
    return [
      {"name": "الفجر", "time": prayerTimes!.fajr},
      {"name": "الشروق", "time": prayerTimes!.sunrise},
      {"name": "الظهر", "time": prayerTimes!.dhuhr},
      {"name": "العصر", "time": prayerTimes!.asr},
      {"name": "المغرب", "time": prayerTimes!.maghrib},
      {"name": "العشاء", "time": prayerTimes!.isha},
    ];
  }

  @override
  void initState() {
    super.initState();

    loadPrayerTimes();

    timer = Timer.periodic(Duration(minutes: 1), (_) {
      if (!mounted) return;
      setState(() {
        now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          CustomAppBar(
            h: h,
            title: "مواقيت الصلاة",
            onTap: () {
              context.go("/home");
            },
          ),
          FutureBuilder(
            future: loadPrayerTimes(),
            builder: (context, snapshot) {
              if (prayers.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: h * 0.02),
                child: Container(
                  height: h * 0.8,
                  child: ListView.builder(
                    itemCount: prayers.length,
                    itemBuilder: (context, count) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: h * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(h * 0.02),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        formatTime(
                                          prayers[count]["time"].toLocal(),
                                        ),
                                        style: TextStyle(
                                          fontSize: h * 0.025,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${remainingTime(prayers[count]["time"])} ",
                                        style: TextStyle(
                                          fontSize: h * 0.017,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        " ${prayers[count]["name"]}",
                                        style: TextStyle(
                                          fontSize: h * 0.025,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: h * 0.01),
                                      Container(
                                        height: h * 0.05,
                                        width: h * 0.05,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            h * 0.02,
                                          ),
                                          color: AppColor.green.withOpacity(
                                            0.3,
                                          ),
                                        ),
                                        child: Icon(Icons.wb_sunny_outlined),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

@pragma('vm:entry-point')
Future<void> playAzan() async {
  final player = AudioPlayer();
  await player.play(AssetSource('audio/019--1.mp3'));
}

@pragma('vm:entry-point')
Future<void> testAlarm() async {
  print("ALARM WORKING 🔔");
}
