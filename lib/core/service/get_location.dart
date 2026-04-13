import 'package:geolocator/geolocator.dart';

class GetLocation {
  static Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 1️⃣ تأكد إن الـ GPS شغال
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      await Geolocator.openLocationSettings(); // يفتح إعدادات الموقع
      throw Exception("من فضلك قم بتفعيل GPS ثم أعد المحاولة");
    }

    // 2️⃣ الصلاحيات
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings(); // يفتح إعدادات التطبيق
      throw Exception("صلاحية الموقع مرفوضة نهائيًا");
    }

    // 3️⃣ لو كل شيء تمام
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
      timeLimit: const Duration(seconds: 5),
    );
  }
}
