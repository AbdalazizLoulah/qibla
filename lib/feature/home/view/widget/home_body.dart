import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qibla/core/service/azan_service.dart';
import 'package:qibla/core/service/schedule_all_prayers.dart';
import 'package:qibla/feature/home/view/widget/custom_counter_adan.dart';
import 'package:qibla/feature/home/view/widget/custom_item.dart';
import 'package:qibla/feature/home/view/widget/custom_time_now.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  // final repeatedSound = RepeatedSound();

  @override
  void initState()  {
    super.initState();
    // repeatedSound.start();
    Future.delayed(Duration(seconds: 2), () async {
      await scheduleAllPrayers();
    });
  }

  @override
  void dispose() {
    // repeatedSound.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> catigory = [
      {
        "icon": Icons.menu_book_rounded,
        "title": "المصحف",
        "des": "قراءة القران الكريم",
        "screen": "/quran",
      },

      {
        "icon": Icons.circle_outlined,
        "title": "سبحة",
        "des": "عداد التسبيح",
        "screen": "/sepha",
      },
      {
        "icon": Icons.handshake,
        "title": "الادعية والاذكار",
        "des": "حصن المسلم",
        "screen": "/do3a",
      },
      {
        "icon": Icons.mosque_outlined,
        "title": "اوقات الصلاة",
        "des": "العهد",
        "screen": "/salah",
      },
      
    ];
    var h = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            CustomTimeNow(h: h),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  CustomCounterAdan(h: h),
                  SizedBox(height: h * 0.03),
                  // CustomEvents(h: h),
                  SizedBox(height: h * 0.001),
                  Container(
                    height: h * 0.5,
                    child: GridView.builder(
                      controller: ScrollController(keepScrollOffset: false),
                      itemCount: catigory.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: h * 0.01,
                        crossAxisSpacing: h * 0.01,
                      ),
                      itemBuilder: (context, counter) {
                        return CustomItem(
                          h: h,
                          title: catigory[counter]["title"],
                          sub: catigory[counter]["des"],
                          icon: catigory[counter]["icon"],
                          onTap: () {
                            context.go(catigory[counter]["screen"]);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RepeatedSound {
  final AudioPlayer _player = AudioPlayer();
  Timer? _timer;

  void start() {
    _timer = Timer.periodic(Duration(seconds: 5), (_) async {
      await _player.play(AssetSource('audio/019--1.mp3'));
      Future.delayed(const Duration(seconds: 2), () {
        _player.stop();
      });
    });
  }

  void stop() {
    _timer?.cancel();
    _player.stop();
  }
}
