import 'package:adhan_dart/adhan_dart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:qibla/core/service/get_location.dart';
import 'package:qibla/core/service/schedule_prayer.dart';

Future<void> scheduleAllPrayers() async {
  Position position = await GetLocation.getLocation();

  final coordinates = Coordinates(position.latitude, position.longitude);

  final params = CalculationMethodParameters.egyptian();

  final todayPrayerTimes = PrayerTimes(
    coordinates: coordinates,
    date: DateTime.now(),
    calculationParameters: params,
  );

  /// صلوات اليوم
  await schedulePrayer(todayPrayerTimes.fajr, 1, "الفجر");
  await schedulePrayer(todayPrayerTimes.dhuhr, 2, "الظهر");
  await schedulePrayer(todayPrayerTimes.asr, 3, "العصر");
  await schedulePrayer(todayPrayerTimes.maghrib, 4, "المغرب");
  await schedulePrayer(todayPrayerTimes.isha, 5, "العشاء");

  /// صلوات الغد
  final tomorrowPrayerTimes = PrayerTimes(
    coordinates: coordinates,
    date: DateTime.now().add(const Duration(days: 1)),
    calculationParameters: params,
  );

  await schedulePrayer(tomorrowPrayerTimes.fajr, 6, "الفجر");
  await schedulePrayer(tomorrowPrayerTimes.dhuhr, 7, "الظهر");
  await schedulePrayer(tomorrowPrayerTimes.asr, 8, "العصر");
  await schedulePrayer(tomorrowPrayerTimes.maghrib, 9, "المغرب");
  await schedulePrayer(tomorrowPrayerTimes.isha, 10, "العشاء");
}
