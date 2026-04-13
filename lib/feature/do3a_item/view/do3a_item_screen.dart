import 'package:flutter/material.dart';
import 'package:qibla/feature/do3a_item/view/widgets/do3a_item_body.dart';

class Do3aItemScreen extends StatelessWidget {
  const Do3aItemScreen({super.key, required this.do3a});
  final String do3a;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Do3aItemBody(do3a: do3a),
      ),
    );
  }
}
