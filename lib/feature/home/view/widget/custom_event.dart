import 'package:flutter/material.dart';

class CustomEvent extends StatefulWidget {
  const CustomEvent({
    super.key,
    required this.h,
    required this.colorContainer,
    required this.title,
    required this.dayCount, required this.icon, required this.colorTitle, required this.colorIcon,
  });

  final double h;
  final Color colorContainer;
  final String title;
  final String dayCount;
  final IconData icon;
  final Color colorTitle;
  final Color colorIcon;

  @override
  State<CustomEvent> createState() => _CustomEventState();
}

class _CustomEventState extends State<CustomEvent> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: widget.h * 0.01,
            vertical: widget.h * 0.01,
          ),
          child: Container(
            height: widget.h * 0.07,
            width: widget.h * 0.07,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: widget.colorContainer.withOpacity(0.3),
            ),
            child: Icon(widget.icon, size: widget.h * 0.035,color: widget.colorIcon,),
          ),
        ),
        Text(
          widget.title,
          style: TextStyle(fontSize: widget.h * 0.02, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: widget.h * 0.01),
        Text(
          widget.dayCount,
          style: TextStyle(
            fontSize: widget.h * 0.02,
            fontWeight: FontWeight.bold,
            color: widget.colorTitle,
          ),
        ),
      ],
    );
  }
}
