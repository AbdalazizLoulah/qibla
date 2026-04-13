import 'package:flutter/material.dart';
import 'package:qibla/feature/salah/view/widget/salah_body.dart';

class SalahScreen extends StatelessWidget {
  const SalahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SalahBody(),));
  }
}