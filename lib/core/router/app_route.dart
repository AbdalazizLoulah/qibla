import 'package:go_router/go_router.dart';
import 'package:qibla/feature/home/view/home_screen.dart';

import 'package:qibla/feature/splash/view/splash_screen.dart';

class AppRoute {
  static final routes = GoRouter(
    routes: [GoRoute(path: "/", builder: (context, state) => SplashScreen()),
      GoRoute(path: "/home", builder: (context, state) => HomeScreen()),
    
    ],
  );
}
