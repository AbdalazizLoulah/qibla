import 'package:flutter/material.dart';
import 'package:qibla/feature/quran_name/view/widget/quran_name_body.dart';

class QuranNameScreen extends StatelessWidget {
  const QuranNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: QuranNameBody(),),
    ) ;
  }
}