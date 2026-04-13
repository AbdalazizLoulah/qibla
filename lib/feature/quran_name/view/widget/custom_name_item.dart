import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qibla/core/constant/color/app_color.dart';

class CustomNameItem extends StatelessWidget {
  const CustomNameItem({
    super.key,
    required this.h,
    required this.number,
    required this.nameArabic,
    required this.nameEnglish,
    required this.place,
    required this.ayaCount,
  });

  final double h;
  final int number;
  final String nameArabic;
  final String nameEnglish;
  final String place;
  final int ayaCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push("/ayat",extra: number);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: h * 0.01),
        child: Container(
          height: h * 0.12,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(h * 0.02),
            border: Border.all(color: AppColor.green),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: h * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: h * 0.06,
                  width: h * 0.06,
                  decoration: BoxDecoration(
                    color: AppColor.green.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(h * 0.02),
                  ),
                  child: Center(
                    child: Text(
                      "$number",
                      style: TextStyle(fontSize: h * 0.02),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("$nameArabic", style: TextStyle(fontSize: h * 0.02)),
                    Text(
                      "${nameEnglish} . $ayaCount آية",
                      style: TextStyle(fontSize: h * 0.015),
                    ),
                  ],
                ),
                Container(
                  height: h * 0.03,
                  width: h * 0.07,
                  decoration: BoxDecoration(
                    color: place.contains("مدنية")
                        ? AppColor.green
                        : Colors.amber,
                    borderRadius: BorderRadius.circular(h * 0.02),
                  ),
                  child: Center(
                    child: Text(
                      "${place}",
                      style: TextStyle(fontSize: h * 0.02),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
