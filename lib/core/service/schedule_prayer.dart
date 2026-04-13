import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:qibla/core/service/play_azan.dart';

Future<void> schedulePrayer(DateTime time, int id, String prayerName) async {
  if (time.isBefore(DateTime.now())) return;
  await AndroidAlarmManager.oneShotAt(
    time,
    id,
    playAzan,
    exact: true,
    wakeup: true,
    params: {"name":prayerName}
  );
}
