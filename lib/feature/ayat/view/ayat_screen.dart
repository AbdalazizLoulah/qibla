import 'package:flutter/material.dart';
import 'package:qibla/feature/ayat/view/widget/ayat_body.dart';

class AyatScreen extends StatelessWidget {
  const AyatScreen({super.key, required this.id});
  final  int id;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: AyatBody(id: id,)));
  }
}
