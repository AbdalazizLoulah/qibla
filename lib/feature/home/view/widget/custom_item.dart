import 'package:flutter/material.dart';
import 'package:qibla/core/constant/color/app_color.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({
    super.key,
    required this.h,
    required this.title,
    required this.sub,
    required this.icon,
    this.onTap,
  });

  final double h;
  final String title;
  final String sub;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: h * 0.17,
        width: h * 0.17,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: h * 0.07,
              width: h * 0.07,
              decoration: BoxDecoration(
                color: AppColor.green,
                borderRadius: BorderRadius.circular(h * 0.02),
              ),
              child: Icon(icon, size: h * 0.05),
            ),
            Text(title, style: TextStyle(fontSize: h * 0.025)),
            Text(
              sub,
              style: TextStyle(fontSize: h * 0.015, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
