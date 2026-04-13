import 'package:flutter/material.dart';
import 'package:qibla/feature/sepha/view/widgets/sepha_body.dart';

class SephaScreen extends StatelessWidget {
  const SephaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SephaBody(),
      ),
    );
  }
}