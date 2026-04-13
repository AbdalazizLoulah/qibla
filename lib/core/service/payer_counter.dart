import 'package:adhan_dart/adhan_dart.dart';
import 'package:qibla/core/service/notification_service.dart';
import 'package:qibla/core/service/prayer_service.dart';
import 'package:qibla/core/service/prayer_timer_service.dart';

class PrayerController {
  final PrayerService prayerService;
  final PrayerTimerService timerService;
  final NotificationService notificationService;
  // final AzanService azanService;

  PrayerController({
    required this.prayerService,
    required this.timerService,
    required this.notificationService,
  
  });

  void start({required Function(Prayer, Duration) onUpdate}) async {
    final result = await prayerService.getNextPrayer();

    Prayer? prayer = result.$1;
    DateTime? time = result.$2;

    timerService.startTimer(
      nextPrayerTime: time!,
      onTick: (remaining) {
        onUpdate(prayer!, remaining);

        String t =
            "${_twoDigits(remaining.inHours)}:"
            "${_twoDigits(remaining.inMinutes.remainder(60))}:"
            "${_twoDigits(remaining.inSeconds.remainder(60))}";

        // notificationService.updateNotification(
        //   PrayerService.prayerName(prayer),
        //   t,
        // );
      },
      onFinish: () async {
        // await azanService.playAzan();

        start(onUpdate: onUpdate);
      },
    );
  }

  void dispose() {
    timerService.dispose();
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');
}
