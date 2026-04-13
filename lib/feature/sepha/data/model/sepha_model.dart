// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SephaModel {
  final int id;
  final Color color;
  final String do3a;
  SephaModel({
    required this.id,
    required this.color,
    required this.do3a,
  });

  static List<Color> colors = [
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.pink,
    Colors.black,
    Colors.lime,
  ];
  static List<SephaModel> do3as = [
    SephaModel(id: 1, color:Colors.green , do3a:"سبحان الله" ),
    SephaModel(id: 2, color: Colors.blue, do3a: "الحمد لله"),
    SephaModel(id: 3, color: Colors.red, do3a: "الله اكبر"),
    SephaModel(id: 4, color: Colors.pink, do3a: "لا اله الا الله"),
    SephaModel(id: 5, color: Colors.black, do3a: "استغفرالله"),
  ];
  static List<int> goals = [33, 99, 100, 500];
}
