import 'package:flutter/material.dart';
import 'package:qibla/feature/home/view/widget/custom_counter_adan.dart';
import 'package:qibla/feature/home/view/widget/custom_item.dart';
import 'package:qibla/feature/home/view/widget/custom_time_now.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                  SizedBox(height: h * 0.03),
                  CustomItem(
                    h: h,
                    title: "السبحة الالكترونية",
                    sub: "ابدا التسبيح والذكر",
                    image: "assets/image/tasbih no bg 1.svg",
                  ),
                  SizedBox(height: h * 0.03),
                  CustomItem(
                    h: h,
                    title: "اتجاه القبلة",
                    sub: "حدد اتجاه الكعبة المشرفة",
                    image: "assets/image/Prayer-Beads-Ramadan.svg",
                  ),
                  SizedBox(height: h * 0.03),
                  CustomItem(
                    h: h,
                    title: "أذكار الصلاة",
                    sub: "أذكار ما بعد الصلاه المكتوبه",
                    image: "assets/image/Praying-Hands-Ramadan.svg",
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
