import 'package:flutter/material.dart';

class CustomContainerTimer extends StatelessWidget {
  const CustomContainerTimer({super.key, required this.h, required this.title, required this.time});

  final double h;
  final String title;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: h * 0.1,
          width: h * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color.fromARGB(255, 210, 208, 208)),
          ),
          child: Center(
            child: Text(
              time,
              style: TextStyle(
                fontSize: h * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: h * 0.02,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
