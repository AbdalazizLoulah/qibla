import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:qibla/core/router/app_route.dart';


// import 'package:qibla/core/service/background_service.dart';
import 'package:qibla/feature/sepha/data/model/tasbeeh_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TasbeehModelAdapter());
  await Hive.openBox<TasbeehModel>('tasbeeh');
  Intl.defaultLocale = 'ar';
  await AndroidAlarmManager.initialize();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: AppRoute.routes);
  }
}
