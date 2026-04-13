import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qibla/feature/do3a/view/widget/custom_item_do3a.dart';
import 'package:qibla/feature/sepha/view/widgets/custom_app_bar.dart';

class Do3aBody extends StatelessWidget {
  const Do3aBody({super.key});

  @override
  Widget build(BuildContext context) {
    List azkar = [
      "اذكار الصباح",
      "اذكار المساء",
      "اذكار النوم",
      "اذكار بعد الصلاه",
      "اذكار منوعة",
    ];
    var h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CustomAppBar(h: h, title: "الادعية و والاذكار",
          onTap: () {
            context.go("/home");
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: h * 0.02),
          child: Container(
            height: h * 0.83,
            child: ListView.builder(
              itemCount: azkar.length,
              itemBuilder: (context, counter) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: h * 0.015),
                  child: GestureDetector(
                    onTap: () {
                      context.go("/do3aItem", extra: azkar[counter]);
                    },
                    child: CustomItemDo3a(h: h, title: "${azkar[counter]}"),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
