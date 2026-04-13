import 'package:flutter/material.dart';
import 'package:qibla/core/constant/color/app_color.dart';

class CustomRoundCounter extends StatefulWidget {
  const CustomRoundCounter({
    super.key,
    required this.h,
    required this.countRound,
    required this.total,
  });

  final double h;
  final int countRound;
  final int total;

  @override
  State<CustomRoundCounter> createState() => _CustomRoundCounterState();
}

class _CustomRoundCounterState extends State<CustomRoundCounter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: widget.h * 0.1,
        decoration: BoxDecoration(
          color: AppColor.green,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "الاجمالى",
                        style: TextStyle(
                          fontSize: widget.h * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${widget.total}",
                        style: TextStyle(
                          fontSize: widget.h * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.all_inclusive),
                  ),
                ],
              ),
              Container(
                height: widget.h * 0.06,
                width: widget.h * 0.001,
                color: Colors.black,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "الدورة",
                        style: TextStyle(
                          fontSize: widget.h * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${widget.countRound}",
                        style: TextStyle(
                          fontSize: widget.h * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.repeat_outlined),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
