import 'package:flutter/material.dart';
import 'package:qibla/feature/do3a/view/widget/do3a_body.dart';

class Do3aScreen extends StatelessWidget {
  const Do3aScreen({super.key,});
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white, body: Do3aBody()),
    );
  }
}
