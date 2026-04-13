import 'package:flutter/material.dart';
import 'package:qibla/core/constant/color/app_color.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.h, required this.title, this.onTap});

  final double h;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h * 0.07,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: h * 0.08),
              child: Container(
                width: h * 0.21,
                height: h * 0.05,
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: h * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onTap ,
            child: Icon(
              Icons.keyboard_arrow_right_rounded,
              size: h * 0.07,
              color: AppColor.green,
            ),
          ),
        ],
      ),
    );
  }
}
