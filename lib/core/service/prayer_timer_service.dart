import 'dart:async';

class PrayerTimerService {
  Timer? timer;

  void startTimer({
    required DateTime nextPrayerTime,
    required Function(Duration) onTick,
    required Function() onFinish,
  }) {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      Duration remaining = nextPrayerTime.difference(DateTime.now());

      if (remaining.inSeconds <= 0) {
        timer?.cancel();
        onFinish();
        return;
      }

      onTick(remaining);
    });
  }

  void dispose() {
    timer?.cancel();
  }
}
