import 'dart:async';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:geolocator/geolocator.dart';

class PrayerService {

  Future<(Prayer?, DateTime?)> getNextPrayer() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition();

    final coordinates = Coordinates(position.latitude, position.longitude);
    final params = CalculationMethodParameters.egyptian();

    final prayerTimes = PrayerTimes(
      date: DateTime.now(),
      coordinates: coordinates,
      calculationParameters: params,
    );

    Prayer? next = prayerTimes.nextPrayer();
    DateTime? nextTime = next != null ? prayerTimes.timeForPrayer(next) : null;

    return (next, nextTime);
  }
  Future<PrayerTimes> getPrayerTimes() async {
    Position position = await Geolocator.getCurrentPosition();

    Coordinates coordinates = Coordinates(
      position.latitude,
      position.longitude,
    );

    final params = CalculationMethodParameters.egyptian();


    PrayerTimes prayerTimes = PrayerTimes( date: DateTime.now() , coordinates:coordinates , calculationParameters:params );

    return prayerTimes;
  }

  static String prayerName(Prayer prayer) {
    switch (prayer) {
      case Prayer.fajr:
        return "الفجر";
      case Prayer.dhuhr:
        return "الظهر";
      case Prayer.asr:
        return "العصر";
      case Prayer.maghrib:
        return "المغرب";
      case Prayer.isha:
        return "العشاء";
      default:
        return "الفجر";
    }
  }
  
}