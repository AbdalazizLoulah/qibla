import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qibla/feature/do3a_item/view/widgets/custom_card_do3a.dart';
import 'package:qibla/feature/do3a_item/view_model/load_azkar.dart';
import 'package:qibla/feature/sepha/view/widgets/custom_app_bar.dart';

class Do3aItemBody extends StatefulWidget {
  const Do3aItemBody({super.key, required this.do3a});
  final String do3a;

  @override
  State<Do3aItemBody> createState() => _Do3aItemBodyState();
}

class _Do3aItemBodyState extends State<Do3aItemBody> {
  String getKey() {
    switch (widget.do3a) {
      case "اذكار الصباح":
        return "morning";
      case "اذكار المساء":
        return "evening";
      case "اذكار النوم":
        return "sleep";

      case "اذكار بعد الصلاه":
        return "after_prayer";

      case "اذكار منوعة":
        return "general_dua";

      default:
        return "morning";
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          CustomAppBar(
            h: h,
            title: "${widget.do3a}",
            onTap: () {
              context.go("/do3a");
            },
          ),
          Container(
            height: h * 0.83,
            child: FutureBuilder(
              future: loadAzkar(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                List azkar = snapshot.data![getKey()];
                return ListView.builder(
                  itemCount: azkar.length,
                  itemBuilder: (context, count) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomCardDo3a(
                        h: h,
                        counter: azkar[count]["repeat"],
                        title: azkar[count]["text"],
                        des: "",
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
