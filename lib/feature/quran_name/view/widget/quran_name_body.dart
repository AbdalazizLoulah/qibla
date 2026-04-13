import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qibla/feature/quran_name/data/model/surah_name.dart';

import 'package:qibla/feature/quran_name/view/widget/custom_name_item.dart';
import 'package:qibla/feature/sepha/view/widgets/custom_app_bar.dart';

class QuranNameBody extends StatelessWidget {
  const QuranNameBody({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAppBar(h: h, title: "المصحف",
            onTap: () {
              context.go("/home");
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: h * 0.02),
            child: Column(
              children: [
                Container(
                  height: h * 0.8,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: surahs.length,
                    itemBuilder: (context, count) {
                      return CustomNameItem(
                        h: h,
                        number: surahs[count].number,
                        nameArabic: "${surahs[count].nameAr}",
                        nameEnglish: "${surahs[count].nameEn}",
                        place: "${surahs[count].type}",
                        ayaCount: surahs[count].ayahCount,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
