import 'package:flutter/material.dart';

class CustomItemDo3a extends StatelessWidget {
  const CustomItemDo3a({super.key, required this.h, required this.title});

  final double h;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h * 0.13,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(h * 0.02),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
        color: Colors.white,
      ),
      child: Center(
        child: Text("$title", style: TextStyle(fontSize: h * 0.04)),
      ),
    );
  }
}
