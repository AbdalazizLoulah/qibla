import 'package:go_router/go_router.dart';
import 'package:qibla/feature/ayat/view/ayat_screen.dart';
import 'package:qibla/feature/do3a/view/do3a_screen.dart';
import 'package:qibla/feature/do3a_item/view/do3a_item_screen.dart';
import 'package:qibla/feature/home/view/home_screen.dart';
import 'package:qibla/feature/quran_name/view/quran_name_screen.dart';
import 'package:qibla/feature/salah/view/salah_screen.dart';
import 'package:qibla/feature/sepha/view/sepha_screen.dart';

import 'package:qibla/feature/splash/view/splash_screen.dart';

class AppRoute {
  static final routes = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => SplashScreen()),
      GoRoute(path: "/home", builder: (context, state) => HomeScreen()),
      GoRoute(path: "/sepha", builder: (context, state) => SephaScreen()),
      GoRoute(path: "/quran", builder: (context, state) => QuranNameScreen()),
      GoRoute(
        path: "/ayat",
        builder: (context, state) {
          final id = state.extra as int;
          return AyatScreen(id: id);
        },
      ),
      GoRoute(path: "/do3a", builder: (context, state) => Do3aScreen()),
      GoRoute(path: "/salah", builder: (context, state) => SalahScreen()),
      GoRoute(
        path: "/do3aItem",
        builder: (context, state) {
          final do3a = state.extra as String;
          return Do3aItemScreen(do3a:do3a);
        },
      ),
    ],
  );
}
