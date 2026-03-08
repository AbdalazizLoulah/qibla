import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qibla/feature/home/view/widget/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: HomeBody(),
      ),
    );
  }
}