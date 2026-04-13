import 'dart:convert';
import 'package:flutter/services.dart';

Future<Map<String, dynamic>> loadAzkar() async {
  String data = await rootBundle.loadString("assets/azkar/azkar_flutter.json");
  return json.decode(data);
}
