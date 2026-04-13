import 'package:flutter/material.dart';
import 'package:qibla/core/constant/color/app_color.dart';

class CustomDo3a extends StatelessWidget {
  const CustomDo3a({super.key, required this.h, required this.do3a});

  final double h;
  final String do3a;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * 0.02),
      child: Container(
        height: h * 0.1,
        width: h * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppColor.green),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColor.green.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.keyboard_arrow_down_sharp, size: h * 0.05),
            Text(
              do3a,
              style: TextStyle(
                fontSize: h * 0.025,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
