import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';


class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Container(
      child: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.greenAccent, Colors.lightGreen],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),Image.asset("assets/image/Vector.png"),
          
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  height: h * 0.3,
                  "assets/image/—Pngtree—hand drawn cartoon praying ramadan_5351151 1.png",
                ),

                SizedBox(height: h * 0.01),
                Text(
                  "قبلة المسلمين",
                  style: TextStyle(fontSize: h * 0.05, color: Colors.black),
                ),
                Center(
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: h * 0.022,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          "فَلَنُوَلِّيَنَّكَ قِبْلَةً تَرْضَاهَا ۚ فَوَلِّ وَجْهَكَ شَطْرَ الْمَسْجِدِ الْحَرَامِ",
                          speed: Duration(milliseconds: 100),
                        ),
                      ],
                      totalRepeatCount: 1,
                    ),
                  ),
                ),
                // Text(
                //   "فَلَنُوَلِّيَنَّكَ قِبْلَةً تَرْضَاهَا ۚ فَوَلِّ وَجْهَكَ شَطْرَ الْمَسْجِدِ الْحَرَامِ",
                //   style: TextStyle(fontSize: h * 0.022,color: Colors.white),
                // ),
                Container(
                  height: h * 0.04,
                  width: h * 0.15,
                  child: Center(
                    child: Text(
                      "سورة البقرة-اية144",
                      style: TextStyle(fontSize: h * 0.02, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: h * 0.96,
            left: h * 0.09,
            child: Text(
              "تم التطوير بواسطه : عبدالعزيز لولح",
              style: TextStyle(
                fontSize: h * 0.02,
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
