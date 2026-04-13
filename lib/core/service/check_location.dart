// import 'dart:async';

// import 'package:geolocator/geolocator.dart';

// class CheckLocation {
//   StreamSubscription<ServiceStatus>? serviceStatusStream;
//   bool dialogOpen = false;
//   Future<void> checkLocation() async {
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

//     if (!serviceEnabled) {
//       showLocationDialog();
//     } else {
//       Future.delayed(Duration(seconds: 6), () {
//         context.go("/home");
//       });
//     }

//     serviceStatusStream = Geolocator.getServiceStatusStream().listen((
//       ServiceStatus status,
//     ) {
//       if (status == ServiceStatus.enabled) {
//         if (dialogOpen) {
//           Navigator.pop(context); // يقفل الرسالة
//         }
//         Future.delayed(Duration(seconds: 6), () {
//           context.go("/home");
//         }); // يفتح الصفحة
//       }
//     });
//   }
// }