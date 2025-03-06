import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homeapp/core/constants/app_colors.dart';
import 'package:homeapp/widgets/custom_button.dart';

class MapScreenDemo extends StatefulWidget {
  final VoidCallback onNext;

  const MapScreenDemo({super.key, required this.onNext});

  @override
  State<MapScreenDemo> createState() => _MapScreenDemoState();
}

class _MapScreenDemoState extends State<MapScreenDemo> {
  String address = "Current location...";
  LatLng? _currentPosition;
  GoogleMapController? _mapController;
  Marker? _currentLocationMarker;

  TextEditingController businessNameController = TextEditingController();
  TextEditingController businessAddressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkLocationService();
    });
  }

  Future<void> _checkLocationService() async {
    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationEnabled) {
      _showEnableLocationDialog();
    } else {
      _requestPermission();
    }
  }

  void _showEnableLocationDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text("Enable Location Services"),
        content: Text("Location is turned off. Please enable it to continue."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel", style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await Geolocator.openLocationSettings();
              _checkLocationService();
            },
            child: Text("Enable Location"),
          ),
        ],
      ),
    );
  }

  Future<void> _requestPermission() async {
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
      _showSettingsDialog();
      return;
    }

    getCurrentPosition();
  }

  Future<void> _showSettingsDialog() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Location Permission Required"),
        content: Text("Please enable location permission in settings."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
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
    try {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);

      setState(() {
        _currentPosition =
            LatLng(currentPosition.latitude, currentPosition.longitude);
        _currentLocationMarker = Marker(
          markerId: MarkerId("currentLocation"),
          position: _currentPosition!,
          infoWindow: InfoWindow(title: "My Address"),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
        );
      });

      if (_mapController != null) {
        _mapController!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: _currentPosition!, zoom: 17),
          ),
        );
      }

      getAddressFromCoordinates(
          currentPosition.latitude, currentPosition.longitude);
    } catch (e) {
      setState(() {
        address = "Failed to get location: $e";
      });
    }
  }

  Future<void> getAddressFromCoordinates(double lat, double lon) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
      Placemark place = placemarks[0];

      setState(() {
        address =
            "${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
        businessAddressController.text = address;
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
      appBar: AppBar(title: Text("Map Screen")),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(20.5937, 78.9629), zoom: 5),
            myLocationEnabled: false,
            markers:
                _currentLocationMarker != null ? {_currentLocationMarker!} : {},
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
              if (_currentPosition != null) {
                _mapController?.animateCamera(
                    CameraUpdate.newLatLngZoom(_currentPosition!, 15));
              }
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: AppColors.darkGreyColor,
                        )),
                    child: Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(width: 7.0),
                        Expanded(
                          child: Text(
                            address,
                            textAlign: TextAlign.start,
                            softWrap: true,
                            style: TextStyle(
                              color: AppColors.darkBlueColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: businessNameController,
                    decoration: InputDecoration(
                      labelText: "Business Name",
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 10),
                  TextField(
                    controller: businessAddressController,
                    decoration: InputDecoration(
                      labelText: "Business Address",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomButton(
                    btnText: "Next",
                    onTap: () {
                      // Navigator.pushNamed(context, AppRoutes.otp);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
