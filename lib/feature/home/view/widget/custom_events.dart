import 'package:flutter/material.dart';
import 'package:qibla/feature/home/view/widget/custom_event.dart';

class CustomEvents extends StatelessWidget {
  const CustomEvents({super.key, required this.h});

  final double h;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h * 0.25,
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "المناسبات القادمة",
                  style: TextStyle(fontSize: h * 0.025),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: h * 0.01),
                  child: Container(
                    height: h * 0.04,
                    width: h * 0.04,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 218, 212, 212),
                    ),
                    child: Icon(Icons.calendar_today_outlined, size: h * 0.025),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: h * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomEvent(
                    h: h,
                    colorContainer: const Color.fromARGB(255, 159, 147, 40),
                    title: "عيد الاضحي",
                    dayCount: "111 يوم",
                    icon: Icons.mosque,
                    colorIcon: Colors.orange,
                    colorTitle: Colors.orange,
                  ),
                  Container(
                    height: h * 0.09,
                    width: h * 0.002,
                    color: Colors.grey,
                  ),
                  CustomEvent(
                    h: h,
                    colorContainer: Colors.green,
                    title: "عيد الفطر",
                    dayCount: "111 يوم",
                    icon: Icons.celebration,
                    colorIcon: Colors.green,
                    colorTitle: Colors.green,
                  ),

                  Container(
                    height: h * 0.09,
                    width: h * 0.002,
                    color: Colors.grey,
                  ),
                  CustomEvent(
                    h: h,
                    colorContainer: Colors.blue,
                    title: "رمضان",
                    dayCount: "111 يوم",
                    icon: Icons.nightlight_round,
                    colorIcon: Colors.blue,
                    colorTitle: Colors.blue,
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
