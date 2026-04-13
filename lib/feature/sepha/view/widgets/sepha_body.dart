import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:qibla/core/constant/color/app_color.dart';
import 'package:qibla/feature/sepha/data/model/sepha_model.dart';
import 'package:qibla/feature/sepha/data/model/tasbeeh_model.dart';
import 'package:qibla/feature/sepha/view/widgets/custom_app_bar.dart';
import 'package:qibla/feature/sepha/view/widgets/custom_do3a.dart';
import 'package:qibla/feature/sepha/view/widgets/custom_round_counter.dart';

class SephaBody extends StatefulWidget {
  const SephaBody({super.key});

  @override
  State<SephaBody> createState() => _SephaBodyState();
}

class _SephaBodyState extends State<SephaBody> {
  int total = 33;
  int current = 0;
  int countRound = 0;
  int countTotal = 0;
  int selectedIndex = 0;
  String selectedDo3a = "سبحان الله";
  final box = Hive.box<TasbeehModel>('tasbeeh');
  double get progress => current / total;
  void loadData() {
    final data = box.get(selectedDo3a);
    if (data != null) {
      current = data.current;
      countRound = data.round;
      total = data.total;
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void increase() {
    setState(() {
      current++;
      if (current > total) {
        current = 0;
        countRound++;
      }

      box.put(
        selectedDo3a,
        TasbeehModel(
          do3a: selectedDo3a,
          current: current,
          round: countRound,
          total: total,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          CustomAppBar(
            h: h,
            title: "السبحة الالكترونية",
            onTap: () {
              context.go("/home");
            },
          ),
          CustomRoundCounter(h: h, countRound: countRound, total: current),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.white,
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) {
                  return Container(
                    height: h * 0.6,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(h * 0.02),
                      child: Column(
                        children: [
                          Text(
                            "اختر الذكر",
                            style: TextStyle(
                              fontSize: h * 0.03,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            height: h * 0.5,
                            child: ListView.builder(
                              itemCount: SephaModel.do3as.length,
                              itemBuilder: (context, count) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      box.put(
                                        selectedDo3a,
                                        TasbeehModel(
                                          do3a: selectedDo3a,
                                          current: current,
                                          round: countRound,
                                          total: total,
                                        ),
                                      );

                                      selectedIndex = count;
                                      selectedDo3a =
                                          SephaModel.do3as[count].do3a;
                                      final data = box.get(selectedDo3a);
                                      if (data != null) {
                                        current = data.current;
                                        countRound = data.round;
                                        total = data.total;
                                      } else {
                                        current = 0;
                                        countRound = 0;
                                        // total = 33;
                                      }
                                      context.pop();
                                    });
                                  },
                                  child: Container(
                                    height: h * 0.08,
                                    decoration: BoxDecoration(
                                      color: selectedIndex == count
                                          ? AppColor.green.withOpacity(0.2)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        h * 0.02,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: h * 0.05,
                                          width: h * 0.3,
                                          child: Center(
                                            child: Text(
                                              SephaModel.do3as[count].do3a,
                                              style: TextStyle(
                                                fontSize: h * 0.03,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                // fontFamily: "Lateef",
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: h * 0.02),
                                        Container(
                                          height: h * 0.05,
                                          width: h * 0.05,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              h * 0.02,
                                            ),
                                            color: SephaModel.do3as[count].color
                                                .withOpacity(0.3),
                                          ),
                                          child: Icon(
                                            Icons.spa_outlined,
                                            color:
                                                SephaModel.do3as[count].color,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: CustomDo3a(h: h, do3a: "${selectedDo3a}"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: h * 0.02),
            child: Container(
              height: h * 0.3,
              width: h * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(h * 0.5),
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
              child: GestureDetector(
                onTap: increase,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: h * 0.25,
                      width: h * 0.25,
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth: h * 0.01,
                        backgroundColor: AppColor.green.withOpacity(0.3),
                        valueColor: AlwaysStoppedAnimation(AppColor.green),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${current}",
                          style: TextStyle(
                            fontSize: h * 0.1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: h * 0.05,
                          width: h * 0.08,
                          decoration: BoxDecoration(
                            color: AppColor.green.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(h * 0.01),
                          ),
                          child: Center(
                            child: Text(
                              "/$total",
                              style: TextStyle(
                                fontSize: h * 0.03,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "هدف مخصص",
                style: TextStyle(
                  fontSize: h * 0.025,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              Text(
                "تحديد الهدف",
                style: TextStyle(
                  fontSize: h * 0.03,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(h * 0.01),
            child: Container(
              height: h * 0.07,
              child: ListView.builder(
                itemCount: SephaModel.goals.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, count) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: h * 0.01),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          total = SephaModel.goals[count];
                          box.put(
                            selectedDo3a,
                            TasbeehModel(
                              do3a: selectedDo3a,
                              current: current,
                              round: countRound,
                              total: total,
                            ),
                          );
                          current = 0;
                        });
                      },
                      child: Container(
                        height: h * 0.06,
                        width: h * 0.09,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.green.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(h * 0.02),
                          border: BoxBorder.all(color: AppColor.green),
                        ),
                        child: Center(
                          child: Text(
                            "${SephaModel.goals[count]}",
                            style: TextStyle(
                              fontSize: h * 0.03,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  current = 0;
                  box.put(
                    selectedDo3a,
                    TasbeehModel(
                      do3a: selectedDo3a,
                      current: current,
                      round: countRound,
                      total: total,
                    ),
                  );
                });
              },
              child: Container(
                height: h * 0.06,
                width: h * 0.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(h * 0.02),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "تصفير",
                      style: TextStyle(
                        fontSize: h * 0.03,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    Icon(Icons.replay_rounded, color: Colors.red),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
