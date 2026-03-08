import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({
    super.key,
    required this.h,
    required this.title,
    required this.sub,
    required this.image,
  });

  final double h;
  final String title;
  final String sub;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h * 0.17,
      width: double.infinity,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: h * 0.07,
            width: h * 0.07,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(h * 0.015),
              color: Colors.green.withOpacity(0.1),
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back,
                size: h * 0.035,
                color: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: h * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: h * 0.028,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  sub,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: h * 0.02,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: h * 0.1,
            width: h * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(h * 0.015),
              color: Colors.greenAccent,
            ),
            child: Center(
              child: SvgPicture.asset(image)
            ),
          ),
        ],
      ),
    );
  }
}
