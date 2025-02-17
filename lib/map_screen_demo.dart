import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class MapScreenDemo extends StatefulWidget {
  const MapScreenDemo({super.key});

  @override
  State<MapScreenDemo> createState() => _MapScreenDemoState();
}

class _MapScreenDemoState extends State<MapScreenDemo> {
  String address = "Fetching address...";

  bool hasPermission = false;

  @override
  void initState() {
    super.initState();
    requestLocationPermission(); // Ask for permission when the screen loads
  }

  void requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      setState(() {
        hasPermission = true;
      });
    }
  }

  void getCurrentPosition() async {
    if (!hasPermission) {
      print("Location permission not granted.");
      return;
    }

    Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    print("Longitude: ${currentPosition.longitude}");
    print("Latitude: ${currentPosition.latitude}");

    getAddressFromCoordinates(
        currentPosition.latitude, currentPosition.longitude);
  }

  Future<void> getAddressFromCoordinates(double lat, double lon) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
      Placemark place = placemarks[0];

      setState(() {
        address =
        "${place.name}, ${place.locality}, ${place.administrativeArea}, ${place
            .country}";
      });
    } catch (e) {
      setState(() {
        address = "Failed to get address: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Map Screen"),
              // hasPermission?Text(address):null;
              ElevatedButton(
                  onPressed: () {}, child: Text("get current location")),
              Text(address),
            ],
          ),
        ));
  }
}
