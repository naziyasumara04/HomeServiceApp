// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:homeapp/widgets/custom_button.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
// import '../../core/constants/app_colors.dart';
// import '../../core/constants/app_images.dart';
//
// class MapScreen extends StatefulWidget {
//   final VoidCallback onNext;
//
//   const MapScreen({super.key, required this.onNext});
//
//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   String address = "Fetching address...";
//
//   bool hasPermission = false;
//
//   @override
//   void initState() {
//     super.initState();
//     requestLocationPermission(); // Ask for permission when the screen loads
//   }
//
//   void requestLocationPermission() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied ||
//         permission == LocationPermission.deniedForever) {
//       permission = await Geolocator.requestPermission();
//     }
//
//     if (permission == LocationPermission.always ||
//         permission == LocationPermission.whileInUse) {
//       setState(() {
//         hasPermission = true;
//       });
//     }
//   }
//
//   void getCurrentPosition() async {
//     if (!hasPermission) {
//       print("Location permission not granted.");
//       return;
//     }
//
//     Position currentPosition = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.best);
//
//     print("Longitude: ${currentPosition.longitude}");
//     print("Latitude: ${currentPosition.latitude}");
//
//     getAddressFromCoordinates(
//         currentPosition.latitude, currentPosition.longitude);
//   }
//
//   Future<void> getAddressFromCoordinates(double lat, double lon) async {
//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
//       Placemark place = placemarks[0];
//
//       setState(() {
//         address =
//             "${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
//       });
//     } catch (e) {
//       setState(() {
//         address = "Failed to get address: $e";
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: buildBody(),
//     );
//   }
//
//   Widget buildBody() {
//     return SingleChildScrollView(
//       child: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 30.h,
//             ),
//             Text(
//               "Allow “FixIt” to use your location",
//               style: TextStyle(
//                   color: AppColors.darkGreyColor,
//                   fontWeight: FontWeight.w500,
//                   fontSize: 18),
//             ),
//             SizedBox(
//               height: 10.h,
//             ),
//             Text(
//               "We need to know your exact location so that\n Clients can find you easily near you.",
//               style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
//             ),
//             SizedBox(
//               height: 10.h,
//             ),
//             Image.asset(AppImages.mapImg),
//             SizedBox(
//               height: 20.h,
//             ),
//             addressCont(),
//             SizedBox(
//               height: 20.h,
//             ),
//             comCont(hintText: 'Business Name'),
//             SizedBox(
//               height: 20.h,
//             ),
//             comCont(hintText: "Business Address"),
//             SizedBox(
//               height: 20.h,
//             ),
//             CustomButton(
//               btnText: "Next",
//               onTap: widget.onNext,
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget addressCont() {
//     return Container(
//       height: 84,
//       width: 327,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(6),
//           border: Border.all(color: AppColors.borderColor, width: 1)),
//       child: ListTile(
//         title: Text(
//           "Street no. 23 Ouch west road Alibagh, Alibagh, Ouch, 18750, Pakistan",
//           style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
//         ),
//         leading: Icon(Icons.location_on),
//       ),
//     );
//   }
//
//   Widget comCont({required final String hintText}) {
//     return SizedBox(
//       height: 56,
//       width: 327,
//       child: TextField(
//         decoration: InputDecoration(
//             hintText: hintText,
//             border: OutlineInputBorder(),
//             enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: AppColors.borderColor)),
//             focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: AppColors.borderColor))),
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
//
// class MapScreenDemo extends StatefulWidget {
//   final VoidCallback onNext;
//   const MapScreenDemo({super.key, required this.onNext});
//
//   @override
//   State<MapScreenDemo> createState() => _MapScreenDemoState();
// }
//
// class _MapScreenDemoState extends State<MapScreenDemo> {
//   String address = "Fetching address...";
//
//   @override
//   void initState() {
//     super.initState();
//     _checkAndRequestPermission();
//   }
//
//   Future<void> _checkAndRequestPermission() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         setState(() {
//           address = "Location permission denied!";
//         });
//         return;
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       setState(() {
//         address = "Location permission permanently denied. Enable from settings.";
//       });
//       _showSettingsDialog();
//       return;
//     }
//
//     getCurrentPosition();
//   }
//
//   Future<void> _showSettingsDialog() async {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Location Permission Required"),
//         content: Text(
//             "This app needs location permission to get your current address. Please enable it in settings."),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text("Cancel"),
//           ),
//           TextButton(
//             onPressed: () async {
//               Navigator.pop(context);
//               await Geolocator.openAppSettings();
//             },
//             child: Text("Open Settings"),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void getCurrentPosition() async {
//     Position currentPosition = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.best);
//
//     getAddressFromCoordinates(
//         currentPosition.latitude, currentPosition.longitude);
//   }
//
//   Future<void> getAddressFromCoordinates(double lat, double lon) async {
//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
//       Placemark place = placemarks[0];
//
//       setState(() {
//         address =
//         "${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
//       });
//     } catch (e) {
//       setState(() {
//         address = "Failed to get address: $e";
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text("Map Screen")),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("Current Address:"),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Text(
//                   address,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     _checkAndRequestPermission();
//                   },
//                   child: Text("Get Current Location"))
//             ],
//           ),
//         ));
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class MapScreenDemo extends StatefulWidget {
  final VoidCallback onNext;

  const MapScreenDemo({super.key, required this.onNext});

  @override
  State<MapScreenDemo> createState() => _MapScreenDemoState();
}

class _MapScreenDemoState extends State<MapScreenDemo> {
  String address = "Press the button to get location.";

  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Column(
          children: [
            // Image.asset("assets/map_preview.png", height: 150), // Add a map image
            SizedBox(height: 10),
            Text("Allow \"FixIt\" to use your location",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        content: Text(
            "We need to know your exact location so that Clients can find you easily near you."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _requestPermission(always: false);
            },
            child: Text("Allow Once", style: TextStyle(color: Colors.blue)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _requestPermission(always: true);
            },
            child: Text("Allow While Using FixIt",
                style: TextStyle(color: Colors.blue)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                address = "Location access denied!";
              });
            },
            child: Text("Don't Allow", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Future<void> _requestPermission({required bool always}) async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          address = "Location permission denied!";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        address = "Permission permanently denied. Enable from settings.";
      });
      _showSettingsDialog(); // 🔹 Now calling the settings dialog here
      return;
    }

    // If granted, fetch location
    getCurrentPosition();
  }

  Future<void> _showSettingsDialog() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Location Permission Required"),
        content: Text(
            "This app needs location permission to get your current address. Please enable it in settings."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await Geolocator.openAppSettings();
            },
            child: Text("Open Settings"),
          ),
        ],
      ),
    );
  }

  void getCurrentPosition() async {
    Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    getAddressFromCoordinates(
        currentPosition.latitude, currentPosition.longitude);
  }

  Future<void> getAddressFromCoordinates(double lat, double lon) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
      Placemark place = placemarks[0];

      setState(() {
        address =
            "${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
      });
    } catch (e) {
      setState(() {
        address = "Failed to get address: $e";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showPermissionDialog();
    });
    print("initState Called");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Map Screen")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Current Address:"),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  address,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                  onPressed: () {}, child: Text("Get Current Location"))
            ],
          ),
        ));
  }
}
