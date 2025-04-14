import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homeapp/screens/service_provider/wiring_installation_address_screen.dart';
import 'package:homeapp/widgets/custom_button.dart';

class WiringInstallationMapScreen extends StatefulWidget {
  const WiringInstallationMapScreen({super.key});

  @override
  State<WiringInstallationMapScreen> createState() =>
      _WiringInstallationMapScreenState();
}

class _WiringInstallationMapScreenState
    extends State<WiringInstallationMapScreen> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  LatLng? _currentPosition;
  Marker? _currentMarker;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      _showLocationServiceDialog();
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    if (permission == LocationPermission.deniedForever) {
      _showPermissionSettingsDialog();
      return;
    }

    _getCurrentLocation();
  }


  void _showLocationServiceDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Location Service Off"),
        content: Text("Please enable location services to continue."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Geolocator.openLocationSettings();
            },
            child: Text("Open Settings"),
          ),
        ],
      ),
    );
  }

  void _showPermissionSettingsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Permission Denied"),
        content: Text("Location permission is permanently denied. Please enable it from settings."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Geolocator.openAppSettings();
            },
            child: Text("Open Settings"),
          ),
        ],
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      _currentMarker = Marker(
        markerId: MarkerId("currentLocation"),
        position: _currentPosition!,
        infoWindow: InfoWindow(title: "Your Location"),
      );
    });

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(_currentPosition!, 16));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wiring Installation"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Center(
        child: Column(
          children: [
            mapContainer(),
            SizedBox(
              height: 100.h,
            ),
            CustomButton(
              btnText: "Fill Manually",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            WiringInstallationAddressScreen()));
                // Navigator.pushNamed(context, AppRoutes.wiringInstallationAddress);
              },
            )
          ],
        ),
      ),
    );
  }





  Widget mapContainer() {
    return Column(
      children: [
        Container(
          height: 500,
          width: 500,
          decoration: BoxDecoration(),
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _currentPosition ?? LatLng(20.5937, 78.9629), // Default to India
              zoom: 5,
            ),
            markers: _currentMarker != null ? {_currentMarker!} : {},
            myLocationEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
      ],
    );
  }


}


