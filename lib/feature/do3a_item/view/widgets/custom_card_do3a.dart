import 'package:flutter/material.dart';
import 'package:qibla/core/constant/color/app_color.dart';

class CustomCardDo3a extends StatefulWidget {
  const CustomCardDo3a({
    super.key,
    required this.h,
    required this.counter,
    required this.title,
    required this.des,
  });

  final double h;
  final int counter;
  final String title;
  final String des;

  @override
  State<CustomCardDo3a> createState() => _CustomCardDo3aState();
}

class _CustomCardDo3aState extends State<CustomCardDo3a> {
  int count = 0;
  void initState() {
    super.initState();
    count = widget.counter;
  }

  void decreaseCounter() {
    if (count > 0) {
      setState(() {
        count--;
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.h * 0.02),
      child: GestureDetector(
        onTap: decreaseCounter,
        child: Container(
          height: widget.h * 0.25,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 5),
              ),
            ],
            borderRadius: BorderRadius.circular(widget.h * 0.01),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: widget.h * 0.16,
                        width: widget.h * 0.29,
                        child: SingleChildScrollView(
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: widget.h * 0.02,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: widget.h * 0.03,
                          width: widget.h * 0.09,
                          decoration: BoxDecoration(
                            color: AppColor.green.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(widget.h * 0.02),
                          ),
                          child: Center(
                            child: Text(
                              widget.des,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  maxRadius: widget.h * 0.03,
                  backgroundColor: count==0?Colors.amber: AppColor.green,
                  child: Text(
                    "${count}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: widget.h * 0.03,
                      color: Colors.black,
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
