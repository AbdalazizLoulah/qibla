import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

class CustomTimeNow extends StatelessWidget {
  const CustomTimeNow({
    super.key,
    required this.h,
    
  });

  final double h;

  @override
  Widget build(BuildContext context) {
    HijriCalendar hijri = HijriCalendar.setLocal("ar");
    String getArabicDate() {
      DateTime now = DateTime.now();

      List<String> days = [
        "الاثنين",
        "الثلاثاء",
        "الأربعاء",
        "الخميس",
        "الجمعة",
        "السبت",
        "الأحد",
      ];

      List<String> months = [
        "يناير",
        "فبراير",
        "مارس",
        "أبريل",
        "مايو",
        "يونيو",
        "يوليو",
        "أغسطس",
        "سبتمبر",
        "أكتوبر",
        "نوفمبر",
        "ديسمبر",
      ];
      return "${days[now.weekday - 1]}، ${now.day} ${months[now.month - 1]} ${now.year}";
    }
    return Stack(
      children: [
        Container(
          height: h * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(h * 0.05),
              bottomRight: Radius.circular(h * 0.05),
            ),
            color: Colors.greenAccent,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "الموقع الحالى",
                      style: TextStyle(
                        fontSize: h * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.location_on,
                      color: Colors.black,
                      size: h*0.025,
                    ),
                  ],
                ),
                SizedBox(height: h * 0.03),
                Text(
                  "${getArabicDate()}",
                  style: TextStyle(
                    fontSize: h * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: h * 0.01),
                Container(
                  height: h * 0.05,
                  width: h * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.green, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      HijriCalendar.now().toFormat("dd MMMM yyyyهـ"),
                      style: TextStyle(
                        fontSize: h*0.02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
